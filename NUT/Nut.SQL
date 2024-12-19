create table users (
  id bigint primary key generated always as identity,
  username text not null unique,
  email text not null unique,
  password text not null,
  created_at timestamptz default now()
);

create table products (
  id bigint primary key generated always as identity,
  name text not null,
  description text not null,
  price numeric(10, 2) not null,
  image_urls text[0] not null,
  created_at timestamptz default now()
);

create table orders (
  id bigint primary key generated always as identity,
  user_id bigint references users (id),
  total_amount numeric(10, 2) not null,
  status text not null,
  created_at timestamptz default now()
);

create table payments (
  id bigint primary key generated always as identity,
  order_id bigint references orders (id),
  method text not null,
  amount numeric(10, 2) not null,
  status text not null,
  created_at timestamptz default now()
);

create table translations (
  id bigint primary key generated always as identity,
  language text not null,
  key text not null,
  value text not null
);

create table cart (
  id bigint primary key generated always as identity,
  user_id bigint references users (id),
  product_id bigint references products (id),
  quantity int not null default 1,
  created_at timestamptz default now()
);