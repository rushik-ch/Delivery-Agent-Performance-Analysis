SELECT agent_name, location,
       COUNT(*) AS total_feedback,
       SUM(CASE WHEN customer_feedback_type = 'Positive' THEN 1 ELSE 0 END) AS positive_feedback,
       SUM(CASE WHEN customer_feedback_type = 'Neutral' THEN 1 ELSE 0 END) AS neutral_feedback,
	   SUM(CASE WHEN customer_feedback_type = 'Negative' THEN 1 ELSE 0 END) AS negative_feedback
FROM delivery_agent_reviews
WHERE customer_feedback_type IN ('Positive', 'Neutral','Negative')
GROUP BY agent_name, location
ORDER BY location;