SELECT agent_name,COUNT(*)
FROM delivery_agent_reviews
GROUP BY agent_name