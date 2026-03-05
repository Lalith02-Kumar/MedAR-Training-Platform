/**
 * ProfileSystem - Centralized profile management, avatar generation, and role styling.
 */
const ProfileSystem = {
    user: null,

    async init() {
        if (!Auth.isAuthenticated()) return;

        try {
            this.user = await api.get('/user/profile');
            this.syncUI();
            this.applyRoleTheme();

            // Listen for profile updates from other tabs
            const bc = new BroadcastChannel('medar_updates');
            bc.onmessage = (event) => {
                if (event.data.type === 'PROFILE_UPDATED') {
                    this.refresh();
                }
            };
        } catch (err) {
            console.error("ProfileSystem Init Error:", err);
            if (err.message.includes('token') || err.message.includes('auth')) {
                Auth.logout();
            }
        }
    },

    async refresh() {
        try {
            this.user = await api.get('/user/profile');
            this.syncUI();
        } catch (err) {
            console.error("ProfileSystem Refresh Error:", err);
        }
    },

    syncUI() {
        if (!this.user) return;

        // Update Greetings
        const greetings = document.querySelectorAll('#user-greeting, #panel-greeting');
        greetings.forEach(el => {
            if (el.id === 'user-greeting') {
                el.innerText = this.user.name;
            } else {
                el.innerText = `Welcome back, ${this.user.name.split(' ')[0]}!`;
            }
        });

        // Update Profile Cards/Views
        const nameViews = document.querySelectorAll('#profile-view-name');
        nameViews.forEach(el => el.innerText = this.user.name);

        const emailViews = document.querySelectorAll('#profile-view-email, #settings-email');
        emailViews.forEach(el => {
            if (el.tagName === 'INPUT') el.value = this.user.email;
            else el.innerText = this.user.email;
        });

        const deptViews = document.querySelectorAll('#profile-view-department');
        deptViews.forEach(el => {
            const deptText = this.user.department || 'Not Set';
            el.innerHTML = `Department: <span class="neon-text">${deptText}</span>`;
        });

        const roleBadges = document.querySelectorAll('#profile-view-role');
        roleBadges.forEach(el => {
            el.innerText = this.user.role.charAt(0).toUpperCase() + this.user.role.slice(1);
            el.className = `top-badge badge-${this.user.role}`;
        });

        const joinedViews = document.querySelectorAll('#profile-view-joined');
        joinedViews.forEach(el => {
            const date = new Date(this.user.created_at).toLocaleDateString([], { month: 'long', year: 'numeric' });
            el.innerText = `Joined ${date}`;
        });

        // Update Avatar
        this.renderAvatar();

        // Populate Form Fields if they exist
        const nameInput = document.getElementById('prof-update-name');
        if (nameInput) nameInput.value = this.user.name;

        const deptInput = document.getElementById('prof-update-dept');
        if (deptInput) deptInput.value = this.user.department || '';

        const picInput = document.getElementById('prof-update-pic');
        if (picInput) picInput.value = this.user.profile_picture || '';
    },

    renderAvatar() {
        const containers = document.querySelectorAll('#profile-avatar-display, .sidebar-avatar');
        containers.forEach(container => {
            if (this.user.profile_picture) {
                container.innerHTML = `<img src="${this.user.profile_picture}" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">`;
            } else {
                container.innerHTML = this.generateAvatarSVG();
            }
        });
    },

    generateAvatarSVG() {
        const initials = this.user.name.split(' ').map(n => n[0]).join('').toUpperCase().slice(0, 2);
        const colors = {
            student: ['#10b981', '#059669'], // Green
            instructor: ['#3b82f6', '#2563eb'], // Blue
            admin: ['#ef4444', '#dc2626'] // Red
        };
        const [c1, c2] = colors[this.user.role] || colors.student;

        return `
            <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%; border-radius: 50%;">
                <defs>
                    <linearGradient id="grad-${this.user.role}" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:${c1};stop-opacity:1" />
                        <stop offset="100%" style="stop-color:${c2};stop-opacity:1" />
                    </linearGradient>
                </defs>
                <circle cx="50" cy="50" r="50" fill="url(#grad-${this.user.role})" />
                <text x="50" y="50" dy=".35em" fill="white" font-family="Inter, sans-serif" font-weight="700" font-size="40" text-anchor="middle">${initials}</text>
            </svg>
        `;
    },

    applyRoleTheme() {
        const role = this.user.role;
        document.documentElement.setAttribute('data-role', role);

        // Dynamic Accent Colors based on role
        const accents = {
            student: '#10b981',
            instructor: '#3b82f6',
            admin: '#ef4444'
        };
        document.documentElement.style.setProperty('--role-accent', accents[role]);
    },

    // Compatibility alias
    populateProfileData() {
        this.syncUI();
    }
};

// Initialize on load
document.addEventListener('DOMContentLoaded', () => {
    ProfileSystem.init();
});
