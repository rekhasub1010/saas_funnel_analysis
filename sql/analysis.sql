DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS trials;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    signup_date DATE,
    acquisition_channel TEXT
);

CREATE TABLE trials (
    user_id INT,
    trial_start_date DATE,
    trial_end_date DATE,
    activated BOOLEAN
);

CREATE TABLE subscriptions (
    user_id INT,
    subscription_start DATE,
    plan_type TEXT,
    churned BOOLEAN
);
