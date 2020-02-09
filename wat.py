import argparse


parser = argparse.ArgumentParser()
subparsers = parser.add_subparsers()

list_parser = subparsers.add_parser('list', help='List all migrations')
list_parser.set_defaults(action='list')

new_parser = subparsers.add_parser('new', help='Create new migration')
new_parser.add_argument('name',
                        nargs='?',
                        help='(optional) name of new migration script')
new_parser.set_defaults(action='new')

run_parser = subparsers.add_parser('run', help='Run migrations')
run_parser.add_argument('name',
                        nargs='?',
                        help='(optional) name/number of migration to run')
run_parser.set_defaults(action='run')

args = parser.parse_args()

print(args)
import pdb; pdb.set_trace();
parser.print_help()
