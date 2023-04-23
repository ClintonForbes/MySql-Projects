
-- Stored Procedure example where you can type in a reviewer ID and get a count of ratings as a result

Delimiter $$
create procedure num_of_ratings_out(in p_id int, out p_total_of_ratings int)
begin
select count(rv.rating)
into p_total_of_ratings 
from reviews rv
join reviewers r on rv.reviewer_id = r.id
where r.id = p_id;
end$$
delimiter ;


set @p_total_of_ratings = 0;
call netflixproject.num_of_ratings_out(5, @p_total_of_ratings);
select @p_total_of_ratings;
