drop function if exists helloworld();
CREATE FUNCTION helloworld() RETURNS varchar as $$
BEGIN
	return 'Hello world';
END
$$ LANGUAGE plpgsql



select * from helloworld()