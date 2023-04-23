
-- Creating a Function where the return value is the average rating for a title

Delimiter $$
create function f_title_avg_rating (p_title varchar(100)) returns decimal(2,1)
deterministic
begin
declare avg_rating decimal(2,1);
select avg(rv.rating)
into avg_rating
from series s 
join reviews rv on s.id = rv.series_id
where s.title = p_title;
return avg_rating;
end $$
Delimiter ;


select f_title_avg_rating('Stranger Things');
