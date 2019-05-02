CREATE OR REPLACE FUNCTION test2(v bigint)
  RETURNS bigint AS
$$begin

return v*3;
end;$$
  LANGUAGE plpgsql