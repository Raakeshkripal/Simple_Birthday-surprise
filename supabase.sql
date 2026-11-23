create table birthday_surprises(
  id uuid primary key default gen_random_uuid(),
  share_id text unique not null,
  recipient_name text not null,
  birthday_date date not null,
  primary_photo_url text not null,
  additional_photo_url text,
  personal_message text,
  song text default 'default',
  song_url text,
  created_at timestamptz default now());
alter table birthday_surprises enable row level security;
create policy "anyone can create" on birthday_surprises for insert to anon with check (true);
-- no select policy: surprises can only be read by exact share_id through this function
create function get_surprise(sid text) returns setof birthday_surprises
language sql security definer set search_path=public as $$ select * from birthday_surprises where share_id=sid $$;
grant execute on function get_surprise(text) to anon;
insert into storage.buckets(id,name,public,file_size_limit) values('songs','songs',true,10485760) on conflict do nothing;
create policy "anyone can upload songs" on storage.objects for insert to anon with check (bucket_id='songs');
