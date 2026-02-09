-- Problem 1: Latest Snapshot per movie
select distinct on (m.title)
m.title, vs.end_date, vs.views, vs.hours_viewed
from view_summary as vs
join movie as m
on vs.movie_id = m.id
order by m.title, vs.end_date desc;

-- Problem 2: Most Recent Season Performance per TV Show
select distinct on (tv.title)
tv.title, s.season_number, vs.end_date, vs.views
from tv_show as tv
join season as s
on tv.id = s.tv_show_id
join view_summary as vs
on s.id = vs.season_id
order by tv.title, vs.end_date desc;

-- Problem 3: Movies That Have Viewing Data
select m.title, m.release_date, vs.views, vs.hours_viewed
from movie as m
join view_summary as vs
on m.id = vs.movie_id 
order by vs.hours_viewed desc;

-- Problem 4: Seasons with Recorded Viewership
select tv.title, s.season_number, vs.views, vs.hours_viewed
from tv_show as tv
join season as s
on tv.id = s.tv_show_id
join view_summary as vs
on s.id = vs.season_id
order by vs.hours_viewed desc;

-- Problem 5: Movies Without Any Viewership
select m.title, m.release_date, vs.views, vs.hours_viewed
from movie as m
left join view_summary as vs
on vs.movie_id = m.id
order by vs.views desc;

-- Problem 6: TV Shows and Their Seasons (Even If Unwatched)
select tv.title, s.season_number, vs.views, vs.hours_viewed
from tv_show as tv
join season as s
on tv.id = s.tv_show_id
left join view_summary as vs
on s.id = vs.season_id
order by vs.hours_viewed desc;

--Problem 7: Viewing Records Without Movie Metadata
select vs.id, vs.movie_id, vs.views
from view_summary as vs
left join movie as m
on vs.movie_id = m.id
where m.id is null;

-- Problem 8: Content Coverage Audit
select m.title, vs.views, vs.start_date, vs.end_date
from movie as m
full join view_summary as vs
on m.id = vs.movie_id
order by m.title;

-- Problem 9: Movies That Have NEVER Been Viewed
select m.title, vs.views 
from movie as m
left join view_summary as vs
on m.id = vs.movie_id
where vs.views is null;

-- Problem 10: Seasons Without Any View Records
select tv.title, s.season_number, vs.views
from tv_show as tv
join season as s
on tv.id = s.tv_show_id
left join view_summary as vs
on s.id = vs.season_id
where vs.views is null;

-- Problem 11: View Records Without Valid Seasons
-- Find view records that reference a season_id that does not exist in the season table.
select vs.season_id,vs.id
from view_summary as vs 
left join season as s
on s.id = vs.season_id
where s.id is null;

-- Problem 12: Movies with no view data
-- View summaries that do not map to any movie

select m.title, vs.views 
from movie as m
full join view_summary as vs
on m.id = vs.movie_id
where vs.movie_id is null or m.id is null;


--Problem 13: Weekly Performance Report for TV Shows
select tv.title, s.season_number, vs.start_date, vs.end_date, vs.views, vs.hours_viewed, view_rank
from tv_show as tv
join season as s
on tv.id = s.tv_show_id
left join view_summary as vs
on s.id = vs.season_id
order by hours_viewed desc;

--Problem 14: Global Availability vs Performance
select m.title, m.available_globally, vs.views, vs.hours_viewed
from movie as m
join view_summary as vs
on m.id = vs.movie_id;

--Problem 15: Top-Performing Content by Locale

