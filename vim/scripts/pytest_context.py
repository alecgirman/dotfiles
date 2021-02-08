from sys import argv
import re

filename = argv[1]
target = int(argv[2]) - 1


class InvalidSpacingException(Exception):
    pass


with open(filename, "r") as file:
    # I would remove empty lines but that would mess up the target line
    lines = file.readlines()


def identify_spacewidth():
    for line in lines:
        if line.startswith(" "):
            for c in line:
                space_width = 0
                if c == " ":
                    space_width += 1
                return space_width
        if line.startswith("\t"):
            return 0


def count_spacing(line, space_width):
    if line.startswith("\t"):
        return len(line) - len(line.lstrip())
    elif line.startswith(" "):
        num_tabs = (len(line) - len(line.lstrip())) / space_width
        if num_tabs.is_integer():
            return num_tabs
        else:
            raise InvalidSpacingException()
    elif line.startswith("\n"):
        # hacky way to make it ignore blank lines
        return 9999
    else:
        return 0


space_width = identify_spacewidth()
current_indent = count_spacing(lines[target], space_width)
parent_lines = []

# start at the target line and go to the top of the file
for i in range(target, -1, -1):
    if (indent := count_spacing(lines[i], space_width)) < current_indent:
        if not lines[i] == "):":
            parent_lines.append(lines[i])
            current_indent = indent

parent_lines = [line.strip() for line in parent_lines]

enclosing_pattern = r"(class|def) (\w+).*:"
parents = [re.search(enclosing_pattern, line).group(2) for line in parent_lines]
parents.reverse()

print(".".join(parents))
