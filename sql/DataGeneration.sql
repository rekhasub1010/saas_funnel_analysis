INSERT INTO users (signup_date, acquisition_channel)
SELECT
    CURRENT_DATE - (random() * 180)::INT,
    CASE
        WHEN random() < 0.4 THEN 'Organic'
        WHEN random() < 0.7 THEN 'Paid Ads'
        WHEN random() < 0.85 THEN 'Referral'
        ELSE 'Social Media'
    END
FROM generate_series(1, 10000);

INSERT INTO trials (user_id, trial_start_date, trial_end_date, activated)
SELECT
    user_id,
    signup_date + (random() * 7)::INT,
    signup_date + (random() * 7)::INT + 14,
    CASE
        WHEN random() < 0.6 THEN TRUE
        ELSE FALSE
    END
FROM users
WHERE random() < 0.65;

INSERT INTO subscriptions (user_id, subscription_start, plan_type, churned)
SELECT
    user_id,
    trial_end_date,
    CASE
        WHEN random() < 0.5 THEN 'Basic'
        ELSE 'Pro'
    END,
    CASE
        WHEN random() < 0.25 THEN TRUE
        ELSE FALSE
    END
FROM trials
WHERE
    (activated = TRUE AND random() < 0.35)
    OR
    (activated = FALSE AND random() < 0.05);
