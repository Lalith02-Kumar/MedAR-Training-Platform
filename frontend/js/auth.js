// Auth handling logic
const Auth = {
    login: async (email, password) => {
        try {
            const res = await api.post('/login', { email, password });
            localStorage.setItem('token', res.token);
            localStorage.setItem('user', JSON.stringify(res.user));
            return res.user;
        } catch (error) {
            throw error;
        }
    },

    register: async (name, email, password, role) => {
        try {
            await api.post('/register', { name, email, password, role });
            // auto login after register
            return await Auth.login(email, password);
        } catch (error) {
            throw error;
        }
    },

    logout: () => {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        window.location.href = 'login.html';
    },

    getUser: () => {
        const userStr = localStorage.getItem('user');
        return userStr ? JSON.parse(userStr) : null;
    },

    tokenIsValid: () => {
        const token = localStorage.getItem('token');
        if (!token) return false;

        try {
            const payload = JSON.parse(atob(token.split('.')[1]));
            return payload.exp > Date.now() / 1000;
        } catch (e) {
            return false;
        }
    },

    isAuthenticated: () => {
        return Auth.tokenIsValid();
    },

    requireAuth: (allowedRoles = null) => {
        if (!Auth.isAuthenticated()) {
            Auth.logout();
            return null;
        }

        const user = Auth.getUser();
        if (!user || typeof user !== 'object' || !user.role) {
            Auth.logout();
            return null;
        }

        if (allowedRoles && !allowedRoles.includes(user.role)) {
            if (user.role === 'student') window.location.href = 'student-dashboard.html';
            else if (user.role === 'instructor') window.location.href = 'instructor-dashboard.html';
            else if (user.role === 'admin') window.location.href = 'admin-dashboard.html';
            return null;
        }
        return user;
    }
};
