Select d.state, sum(d.males) total_male, sum(d.females) total_Female from
(Select c.district, c.state, c.population/(c.sex_ratio+1) males, (c.population*c.sex_ratio)/ (c.sex_ratio+1) females from
(select a.district, a.state, a.sex_ratio/1000 sex_ratio, b.population from dataset1 a inner join dataset2 b on a.district = b.district ) c)d 
group by d.state;

-- total literacy rate

/* literacy ratio= total literate people/ population,
total literate people= population*literacy ratio,
total illeterate people = population- total literate people or (1-literacy ratio)*population */

Select c.district, c.state, c.population, c.population*c.literacy_ratio literate_people, (1-c.literacy_ratio)*c.population illetrate_people from
(Select a.district, a.state, b.population, a.literacy/100 literacy_ratio from dataset1 a join dataset2 b on a.district=b.district) c;

