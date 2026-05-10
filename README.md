# ChirpX — Modern Social Media Platform

> ⚠️ **DEMO/EDUCATIONAL PURPOSE ONLY** — All engagement data (likes, reposts, followers, views, comments) is entirely **simulated and fictional**. No real social media APIs are used.

---

## 🚀 Features

- **Auth**: Login, Signup, Email verification mock, Forgot/Reset password, JWT sessions
- **Social**: Posts (text/image/video/GIF), threads, polls, hashtags, mentions, drafts, scheduling
- **Engagement**: Simulated likes, reposts, views, comments, followers (all fictional/demo)
- **Feed**: Home, Following, Trending, Explore, Infinite scroll
- **Messaging**: DMs, Group chats, typing indicators, reactions, online status
- **Notifications**: Real-time push-style dropdown notifications
- **Admin Panel**: Analytics, user management, post moderation, bot manager
- **Profile**: Bio, avatar/banner upload, badges, verification badge, stats
- **Dark Mode** + Mobile Responsive

---

## 📁 Folder Structure

```
chirpx/
├── frontend/
│   ├── index.html              # Landing page
│   ├── login.html              # Login page
│   ├── register.html           # Register page
│   ├── forgot-password.html    # Forgot password
│   ├── reset-password.html     # Reset password
│   ├── verify-email.html       # Email verification
│   ├── dashboard.html          # Main feed/dashboard
│   ├── explore.html            # Explore page
│   ├── profile.html            # User profile
│   ├── messages.html           # Messaging UI
│   ├── notifications.html      # Notification center
│   ├── admin.html              # Admin dashboard
│   ├── settings.html           # Profile settings
│   ├── css/
│   │   ├── main.css            # Global styles + variables
│   │   ├── auth.css            # Auth pages
│   │   ├── dashboard.css       # Dashboard layout
│   │   ├── profile.css         # Profile page
│   │   ├── messages.css        # Messaging UI
│   │   ├── admin.css           # Admin panel
│   │   └── animations.css      # All animations
│   └── js/
│       ├── app.js              # Core app + router
│       ├── auth.js             # Auth logic
│       ├── feed.js             # Feed/post logic
│       ├── simulator.js        # Engagement simulator (DEMO)
│       ├── notifications.js    # Notification system
│       ├── messages.js         # Messaging logic
│       ├── admin.js            # Admin panel logic
│       ├── profile.js          # Profile logic
│       ├── emoji.js            # Emoji picker
│       └── utils.js            # Utility functions
├── backend/
│   ├── server.js               # Express entry point
│   ├── config/
│   │   └── db.js               # MySQL connection
│   ├── routes/
│   │   ├── auth.js             # Auth routes
│   │   ├── posts.js            # Post CRUD
│   │   ├── users.js            # User routes
│   │   ├── feed.js             # Feed routes
│   │   ├── messages.js         # Messaging routes
│   │   ├── notifications.js    # Notification routes
│   │   └── admin.js            # Admin routes
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── postController.js
│   │   ├── userController.js
│   │   └── adminController.js
│   ├── middleware/
│   │   ├── auth.js             # JWT middleware
│   │   ├── rateLimit.js        # Rate limiting
│   │   ├── csrf.js             # CSRF protection
│   │   └── upload.js           # File upload handler
│   ├── models/
│   │   └── index.js            # DB models/queries
│   └── utils/
│       ├── jwt.js              # Token helpers
│       ├── hash.js             # Bcrypt helpers
│       └── mailer.js           # Mock email sender
├── database/
│   ├── schema.sql              # Full DB schema
│   └── seed.sql                # Demo seed data
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── .env.example
└── README.md
```

---

## ⚙️ Setup Instructions

### Prerequisites
- Node.js 18+
- MySQL 8+
- npm or yarn

### 1. Clone & Install
```bash
git clone https://github.com/yourname/chirpx.git
cd chirpx
npm install
cd backend && npm install
```

### 2. Configure Environment
```bash
cp .env.example .env
# Edit .env with your MySQL credentials and JWT secret
```

### 3. Setup Database
```bash
mysql -u root -p < database/schema.sql
mysql -u root -p chirpx < database/seed.sql
```

### 4. Start Backend
```bash
cd backend
npm run dev
```

### 5. Open Frontend
Open `frontend/index.html` in your browser, or use Live Server.

---

## 🐳 Docker Setup
```bash
docker-compose -f docker/docker-compose.yml up --build
```

---

## 🔑 Demo Credentials
| Role  | Email                 | Password  |
|-------|-----------------------|-----------|
| Admin | admin@chirpx.demo     | Admin123! |
| User  | alex@chirpx.demo      | Demo123!  |
| User  | maya@chirpx.demo      | Demo123!  |

---

## 🔒 Security Features
- bcrypt password hashing (salt rounds: 12)
- JWT access + refresh tokens
- CSRF token protection
- Rate limiting (express-rate-limit)
- Input sanitization (DOMPurify frontend, express-validator backend)
- Role-based access control (user / admin)
- SQL injection prevention via parameterized queries

---

## ⚠️ Disclaimer
All user data, engagement metrics, follower counts, likes, reposts, and trending data are **100% fictional and simulated** for demo/educational purposes only. This platform is NOT connected to Twitter/X or any real social media service. No real user data is collected.

---

## 📄 License
MIT — For educational and demo use only.
