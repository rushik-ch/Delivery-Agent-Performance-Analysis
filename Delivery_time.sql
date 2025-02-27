SELECT agent_name,location,MAX(delivery_time) AS Slowest_delivery,MIN(delivery_time) AS Fastest_delivery
from delivery_agent_reviews
group by agent_name,location
order by location ASC;