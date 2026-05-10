-- ============================================
-- ChirpX Demo Seed Data
-- All data is FICTIONAL for demo purposes only
-- ============================================
USE chirpx;

-- Demo Users (passwords are all: Demo123! / Admin123!)
-- Hashes generated with bcrypt rounds=12
INSERT INTO users (username, display_name, email, password_hash, bio, is_verified, is_admin, email_verified, role, simulated_followers, simulated_following, simulated_posts, avatar_url) VALUES
('admin', 'ChirpX Admin', 'admin@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJaaaaaaaaaaaaaaaaaaaa', 'Official ChirpX platform account 🐦', 1, 1, 1, 'admin', 99812, 42, 287, '/frontend/assets/avatars/admin.png'),
('alex_rivers', 'Alex Rivers', 'alex@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJbbbbbbbbbbbbbbbbbbbb', 'Tech enthusiast | Coffee addict | Building cool stuff 🚀', 1, 0, 1, 'user', 48293, 512, 1043, '/frontend/assets/avatars/alex.png'),
('maya_chen', 'Maya Chen', 'maya@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJcccccccccccccccccccc', 'Designer & Creative Director | She/Her | Making pixels pretty ✨', 1, 0, 1, 'user', 31847, 287, 762, '/frontend/assets/avatars/maya.png'),
('dev_marco', 'Marco Dev', 'marco@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJdddddddddddddddddddd', 'Full-stack developer | Open source | 🦀 Rust lover', 0, 0, 1, 'user', 12450, 943, 2103, '/frontend/assets/avatars/marco.png'),
('sarahcodes', 'Sarah Mitchell', 'sarah@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJeeeeeeeeeeeeeeeeeeee', 'Senior Engineer @BigTechCo | Speaker | Mentor | she/her', 1, 0, 1, 'user', 89234, 1203, 4521, '/frontend/assets/avatars/sarah.png'),
('travel_jess', 'Jessica Wong', 'jess@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJffffffffffffffffffffff', '✈️ Travel blogger | 47 countries | Foodie | Adventure seeker', 0, 0, 1, 'user', 234891, 2310, 8920, '/frontend/assets/avatars/jess.png'),
('crypto_king', 'DeFi Dave', 'dave@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJgggggggggggggggggggg', '₿ Bitcoin maximalist | NFT skeptic | Building web3 (ironically)', 0, 0, 1, 'user', 18293, 4821, 3421, '/frontend/assets/avatars/dave.png'),
('art_zara', 'Zara Okonkwo', 'zara@chirpx.demo', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMZJhhhhhhhhhhhhhhhhhhhh', '🎨 Digital artist & illustrator | Commissions open | Lagos/London', 1, 0, 1, 'user', 156723, 893, 2894, '/frontend/assets/avatars/zara.png');

-- Simulated Bot Users
INSERT INTO sim_bots (name, username, avatar_url, bio, post_frequency) VALUES
('TechBot Alpha', 'techbot_alpha', '/frontend/assets/avatars/bot1.png', 'AI-powered tech news aggregator', 45),
('Trend Watcher', 'trendwatcher', '/frontend/assets/avatars/bot2.png', 'Tracking what''s hot right now 🔥', 30),
('Meme Lord 9000', 'memelord9k', '/frontend/assets/avatars/bot3.png', 'Dank memes delivered fresh', 20),
('News Flash', 'newsflash_sim', '/frontend/assets/avatars/bot4.png', 'Simulated breaking news', 60),
('Quote Bot', 'daily_quotes', '/frontend/assets/avatars/bot5.png', 'Daily inspiration (simulated)', 90);

-- Follows
INSERT INTO follows (follower_id, following_id) VALUES
(2, 3), (2, 4), (2, 5), (2, 8),
(3, 2), (3, 5), (3, 8),
(4, 2), (4, 3), (4, 5),
(5, 2), (5, 3), (5, 8),
(6, 2), (6, 3), (6, 5), (6, 8),
(7, 2), (7, 4),
(8, 3), (8, 5), (8, 6);

-- Demo Posts
INSERT INTO posts (user_id, content, sim_likes, sim_reposts, sim_views, sim_comments, is_trending, media_type) VALUES
(2, 'Just shipped a feature I''ve been working on for 3 weeks. The feeling of seeing it go live is unmatched. #buildinpublic #shipping 🚀', 8421, 1203, 94821, 342, 1, 'none'),
(3, 'Hot take: most "design systems" are just CSS variables and some courage. Fight me. #design #ux #frontend', 12034, 2891, 182930, 891, 1, 'none'),
(5, 'Thread: 10 things I wish I knew before becoming a senior engineer 🧵\n\n1/ Technical skills are only ~30% of the job. Communication, empathy, and documentation matter way more than most bootcamps teach.', 34891, 8923, 421893, 1203, 1, 'none'),
(8, 'New digital art piece just dropped. 72 hours of work, 340 layers, zero regrets. ✨ #digitalart #illustration #artlovers', 28934, 4521, 312891, 892, 1, 'image'),
(6, 'I''ve now visited 47 countries and the one thing nobody tells you: the best food is ALWAYS at the unmarked local spot with plastic chairs. Every single time. 🍜', 19234, 3812, 198234, 621, 0, 'none'),
(4, 'Unpopular opinion: TypeScript makes simple things complicated and complicated things possible. Both are true simultaneously.', 7823, 1829, 89234, 412, 0, 'none'),
(5, 'Gentle reminder: "works on my machine" is not a deployment strategy. #devops #engineering', 15892, 3421, 189234, 534, 1, 'none'),
(3, 'The gap between "I designed it" and "I made it accessible" is a canyon that most designers haven''t crossed. Accessibility is not an afterthought. #a11y #design', 9823, 2134, 112893, 312, 0, 'none'),
(2, 'POV: you''re debugging a production issue at 2am and it turns out to be a missing semicolon 😭 #devlife #programming', 22891, 5432, 267891, 789, 1, 'none'),
(7, 'Everyone''s talking about AI taking jobs. Meanwhile I''m using AI to write the description for my vacation photos so I sound smarter than I am 😂', 6234, 892, 78234, 189, 0, 'none');

-- Hashtags
INSERT INTO hashtags (tag, sim_post_count, is_trending) VALUES
('buildinpublic', 48291, 1),
('design', 189234, 1),
('frontend', 92834, 1),
('shipping', 38291, 0),
('ux', 74821, 1),
('devlife', 234891, 1),
('programming', 398291, 1),
('typescript', 89234, 0),
('digitalart', 156892, 1),
('artlovers', 234891, 0),
('a11y', 28934, 0),
('devops', 67823, 0),
('engineering', 189234, 1),
('AI', 891234, 1),
('web3', 48293, 0),
('travel', 891234, 1),
('food', 1293821, 0),
('illustration', 312891, 0),
('openSource', 78234, 0),
('rust', 34821, 0);

-- Post Hashtags (linking)
INSERT INTO post_hashtags (post_id, hashtag_id) VALUES
(1, 1), (1, 4),
(2, 2), (2, 5), (2, 3),
(3, 6), (3, 13),
(4, 9), (4, 10), (4, 18),
(5, 16), (5, 17),
(6, 8),
(7, 12), (7, 13),
(8, 2), (8, 11),
(9, 6), (9, 7),
(10, 14);

-- Notifications (demo)
INSERT INTO notifications (user_id, actor_id, type, post_id, message) VALUES
(2, 3, 'like', 1, 'Maya Chen liked your post'),
(2, 5, 'repost', 1, 'Sarah Mitchell reposted your post'),
(2, 8, 'follow', NULL, 'Zara Okonkwo started following you'),
(2, 5, 'comment', 1, 'Sarah Mitchell replied to your post'),
(3, 2, 'like', 2, 'Alex Rivers liked your post'),
(3, 6, 'follow', NULL, 'Jessica Wong started following you'),
(5, 2, 'mention', 3, 'Alex Rivers mentioned you in a post'),
(5, 8, 'like', 3, 'Zara Okonkwo liked your thread');

-- Conversations (DMs)
INSERT INTO conversations (name, is_group, created_by) VALUES
(NULL, 0, 2),
(NULL, 0, 3),
('ChirpX Builder Squad 🚀', 1, 2);

INSERT INTO conversation_members VALUES
(1, 2, NOW()), (1, 3, NOW()),
(2, 3, NOW()), (2, 5, NOW()),
(3, 2, NOW()), (3, 3, NOW()), (3, 4, NOW()), (3, 5, NOW());

-- Messages
INSERT INTO messages (conversation_id, sender_id, content, is_read) VALUES
(1, 3, 'Hey! Loved your post about shipping features 🔥', 1),
(1, 2, 'Thanks! Took forever but worth it. Working on anything cool?', 1),
(1, 3, 'Yes! Redesigning our whole component library. Want to collaborate?', 0),
(2, 5, 'Your thread on senior eng skills was 🔥 bookmarked it', 1),
(2, 3, 'Thank you! It took a while to write but I''m glad it resonated', 0),
(3, 2, 'Hey squad! Anyone want to build something together?', 1),
(3, 3, 'Yes!! What are you thinking?', 1),
(3, 4, 'I''m in. Need a backend dev?', 1),
(3, 5, 'Count me in! I can help with architecture', 0);