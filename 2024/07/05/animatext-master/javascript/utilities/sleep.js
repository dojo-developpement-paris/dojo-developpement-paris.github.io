export const sleep = (duration, ...args) => {
    return new Promise((resolve) => {
        setTimeout(resolve, duration, ...args);
    })
}