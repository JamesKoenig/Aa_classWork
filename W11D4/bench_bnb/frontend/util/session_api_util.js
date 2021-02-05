
export const signup = (user) => {
    return $.ajax({
        url: '/api/users',
        method: 'POST',
        data: { user }
    });
};

export const login = () => {
    return $.ajax({
        url: '/api/session',
        method: 'POST'
    });
};

export const logout = () => {
    return $.ajax({
        url: '/api/session',
        method: 'DELETE'
    });
};