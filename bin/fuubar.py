#!/usr/bin/env python3
import argparse
import json
import os
import re
import subprocess
import sys


def lint_govet(file):
    try:
        result = subprocess.run(['go', 'vet', './...'], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stderr.splitlines():
        match = re.match(r"^([^:]+):(\d+):\d+: (.*)$", line)
        if match and match.group(1) == file:
            yield {
                'file': match.group(1),
                'line': match.group(2),
                'message': match.group(3),
            }


def lint_golint(file):
    try:
        result = subprocess.run(['golint', '-set_exit_status', './...'], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stderr.splitlines():
        match = re.match(r"^([^:]+):(\d+):\d+: (.*)$", line)
        if match and match.group(1) == file:
            yield {
                'file': match.group(1),
                'line': match.group(2),
                'message': match.group(3),
            }


def lint_yaml(file):
    try:
        result = subprocess.run(['yamllint', '--strict', '--format=parsable', file], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stdout.splitlines():
        match = re.match(r"^([^:]+):(\d+):\d+: (.*)$", line)
        if match:
            yield {
                'file': match.group(1),
                'line': match.group(2),
                'message': match.group(3),
            }


def lint_jq(file):
    try:
        result = subprocess.run(['jq', '.', file], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stderr.splitlines():
        match = re.match(r"^parse error: (.*) at line (\d+), .*$", line)
        if match:
            yield {
                'file': file,
                'line': match.group(2),
                'message': match.group(1),
            }


def lint_flake8(file):
    try:
        result = subprocess.run(['flake8', '--extend-ignore', 'E501', file], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stdout.splitlines():
        match = re.match(r"^(.*):(\d+):\d+:(.*)$", line)
        if match:
            yield {
                'file': match.group(1),
                'line': match.group(2),
                'message': match.group(3),
            }


def lint_php(file):
    try:
        result = subprocess.run(['php', '-l', file], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stdout.splitlines():
        match = re.match(r"^Parse error: (.*) in (.*) on line (\d+)$", line)
        if match:
            yield {
                'file': match.group(2),
                'line': match.group(3),
                'message': match.group(1),
            }


def lint_phpstan(file):
    try:
        result = subprocess.run(['bin/phpstan', 'analyse', '--no-ansi', '--no-interaction', '--no-progress', '--error-format=json', file], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    data = json.loads(result.stdout)
    cwd = subprocess.run(["php", "-r", "echo getcwd();"], capture_output=True, text=True).stdout
    if 'files' not in data:
        for file, errors in data['files'].items():
            for error in errors['messages']:
                yield {
                    'file': os.path.relpath(file, cwd),
                    'line': error['line'],
                    'message': error['message'],
                }


def lint_rubocop(file):
    try:
        result = subprocess.run(['chef', 'exec', 'rake', 'style:ruby'], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stdout.splitlines():
        match = re.match(r"^([^:]*):(\d+):\d+: (.*)$", line)
        if match and match.group(1) == file:
            yield {
                'file': match.group(1),
                'line': match.group(2),
                'message': match.group(3),
            }


def lint_foodcritic(file):
    try:
        result = subprocess.run(['foodcritic', '--no-progress', file], capture_output=True, text=True)
    except FileNotFoundError:
        return []
    for line in result.stdout.splitlines():
        match = re.match(r"^(.*): ([^:]+):(\d+)$", line)
        if match:
            yield {
                'file': match.group(2),
                'line': match.group(3),
                'message': match.group(1),
            }


def lint_whitespace(file, spaces=True, clrf=True, tabs=True):
    linenr = 1
    with open(file, 'rb') as in_file:
        for line in in_file:
            if spaces and re.match(b"^.*[ \t](\r)?\n$", line):
                yield {'file': file, 'line': linenr, 'message': 'trailing spaces detected'}
            if clrf and re.match(b"^.*\r\n$", line):
                yield {'file': file, 'line': linenr, 'message': 'windows line endings detected'}
            if tabs and re.match(b"^\t+", line):
                yield {'file': file, 'line': linenr, 'message': 'literal tab characters detected'}
            linenr += 1


def fix_clrf(file):
    subprocess.run(['dos2unix', '--safe', file], check=True)


def fix_whitespace(file):
    subprocess.run(['sed', '-i', '-e', 's/[ 	]*$//', file], check=True)
    print("Ran sed to remove trailing tabs and white spaces")


def fix_php_cs_fixer(file):
    subprocess.run(['php-cs-fixer', 'fix', '--no-ansi', '--no-interaction', file], check=True)


def fix_gofmt(file):
    subprocess.run(['gofmt', '-w', '-s', file], check=True)


def fix_goimports(file):
    subprocess.run(['goimports', '-w', file], check=True)


def fix_json(file):
    with open(file, 'r') as in_file:
        data = json.load(in_file)
    with open(file, 'w') as out_file:
        json.dump(data, out_file, indent=2, sort_keys=True)
        out_file.write('\n')


def lint(args):
    for file in args.files:
        for ext, linters in MAPPING['linter'].items():
            if file.endswith(ext):
                for linter in linters:
                    if type(linter) is list:
                        linter, kwargs = linter
                    else:
                        kwargs = {}
                    if args.verbose:
                        print("==> Run {} on file {}".format(linter.__name__, file))
                    for error in linter(file, **kwargs):
                        print("{file}||{line}||{message}".format(**error))


def fix(args):
    for file in args.files:
        for ext, fixers in MAPPING['fixer'].items():
            if file.endswith(ext):
                for fixer in fixers:
                    print("==> Run {} on file {}".format(fixer.__name__, file))
                    fixer(file)


MAPPING = {
    'linter': {
        '.go':   [[lint_whitespace, dict(tabs=False)], lint_govet, lint_golint],
        '.json': [lint_whitespace, lint_jq],
        '.php':  [lint_whitespace, lint_php, lint_phpstan],
        '.py':   [lint_whitespace, lint_flake8],
        '.rb':   [lint_whitespace, lint_rubocop, lint_foodcritic],
        '.yaml': [lint_whitespace, lint_yaml],
        '.yml':  [lint_whitespace, lint_yaml],
    },
    'fixer': {
        '.go':   [fix_clrf, fix_whitespace, fix_gofmt, fix_goimports],
        '.json': [fix_clrf, fix_whitespace, fix_json],
        '.php':  [fix_clrf, fix_whitespace, fix_php_cs_fixer],
        '.rb':   [fix_clrf, fix_whitespace],
        '.yaml': [fix_clrf, fix_whitespace],
        '.yml':  [fix_clrf, fix_whitespace],
    }
}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--verbose", action='store_true', help="show what is being done")
    parser.add_argument("files", nargs='*', help="files to lint")
    args = parser.parse_args()
    if sys.argv[0].endswith('linter'):
        return lint(args)
    elif sys.argv[0].endswith('fixer'):
        return fix(args)
    print("error: symlink {} to `linter` or `fixer`".format(sys.argv[0]))


if __name__ == '__main__':
    main()
