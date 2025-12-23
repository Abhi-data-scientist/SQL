use world;
show tables;
select * from country;

-- function in string:-
		-- 1. case conversion
        select name, upper(name), lower(name) from country;
        -- 2. Add two strings =>  concate :- in this we need to give seprate value
        select name, code, concat(name,code) from country;
        select name, code, concat(name, "$",code) from country;
        select name, code, concat(name, "$",code,' ','Abhishek') from country;
		-- 3. concat_ws we don't need to do separation
        select name, code, concat_ws('$', name, code, 'abhishek') from country;
		-- we can use functions in filter
        select name, code, concat_ws(' ', name, code) from country where concat_ws(' ',name,code)='Afghanistan AFG';
		
-- get the country name, continent, region where in the region the continent name should be present
select name, continent, region, concat('%',continent,'%') from country where region like concat('%',continent, '%');
-- get the country name where name should like region name 
select name, region from country where name like region;
--  get the country name, continent, population where the first character of the continent should be same as of country
-- left (name,1) is use to find character from left 
select name, continent, population from country where left(name,1)=left(continent,1);

		-- 4. substr/substring(string,start,end)
        select name, substr(name,2,4) from country;
			-- also use negative indexing in this. it returns last characters
            -- last 3 charcters
			select name, substr(name,-3) from country;
            -- last 4 se 2 charcter
            select name, substr(name,-4,2) from country;
            
-- get the country name where name's first charcter same as continent's first charcter
select name, continent from country where substr(name,1,1)=substr(continent,1,1);
-- get the country name and population where the starting three charcter of country is 'ALG'
select name, population from country where substr(name,1,3)='Alg';

		-- 5. instr(string,'a') it return the position where the character is present
        select name, instr(name,'e') from country;
		-- 6. char_length(string) => length of string
        select name, char_length(name) from country;
        -- 7. trim(string) => use to remove extra white spaces from left or right most 
			-- => rtrim,ltrim
        select char_length('  abhi   ');
        select char_length((trim('  abhi   ')));
        select trim(both 'z' from '  abhi hzzzzzzzzzzz');












