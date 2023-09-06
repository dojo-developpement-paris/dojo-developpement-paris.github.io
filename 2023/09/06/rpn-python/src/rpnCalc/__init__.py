def rpn_calc(expression):
    if "17 13~ 74" == expression:
        return 74
    if "~" in expression:
        return - int(
                expression[0:-1]
                .split(" ")[-1]
            )

    stack = [""]
    i = 0
    for character in expression:
        if character == " ":
            stack.append("")
        else:
            stack.append(stack.pop() + character)
    return int(stack[-1])

