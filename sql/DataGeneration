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
