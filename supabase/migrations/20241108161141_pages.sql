create type "public"."enum_pages_blocks_two_column_direction" as enum ('default', 'reverse');

create sequence "public"."pages_id_seq";

drop index if exists "public"."media_created_at_idx";

drop index if exists "public"."media_filename_idx";

drop index if exists "public"."media_updated_at_idx";

drop index if exists "public"."payload_locked_documents_created_at_idx";

drop index if exists "public"."payload_locked_documents_global_slug_idx";

drop index if exists "public"."payload_locked_documents_rels_media_id_idx";

drop index if exists "public"."payload_locked_documents_rels_users_id_idx";

drop index if exists "public"."payload_locked_documents_updated_at_idx";

drop index if exists "public"."payload_migrations_created_at_idx";

drop index if exists "public"."payload_migrations_updated_at_idx";

drop index if exists "public"."payload_preferences_created_at_idx";

drop index if exists "public"."payload_preferences_key_idx";

drop index if exists "public"."payload_preferences_rels_users_id_idx";

drop index if exists "public"."payload_preferences_updated_at_idx";

drop index if exists "public"."users_created_at_idx";

drop index if exists "public"."users_email_idx";

drop index if exists "public"."users_updated_at_idx";

create table "public"."pages" (
    "id" integer not null default nextval('pages_id_seq'::regclass),
    "slug" character varying not null,
    "updated_at" timestamp(3) with time zone not null default now(),
    "created_at" timestamp(3) with time zone not null default now(),
    "name" character varying not null
);


create table "public"."pages_blocks_hero" (
    "_order" integer not null,
    "_parent_id" integer not null,
    "_path" text not null,
    "id" character varying not null,
    "heading" character varying,
    "text" character varying,
    "background_image_id" integer,
    "block_name" character varying
);


create table "public"."pages_blocks_two_column" (
    "_order" integer not null,
    "_parent_id" integer not null,
    "_path" text not null,
    "id" character varying not null,
    "heading" character varying,
    "text" character varying,
    "image_id" integer,
    "direction" enum_pages_blocks_two_column_direction,
    "block_name" character varying
);


alter table "public"."payload_locked_documents_rels" add column "pages_id" integer;

alter sequence "public"."pages_id_seq" owned by "public"."pages"."id";

CREATE INDEX media_created_at_2_idx ON public.media USING btree (created_at);

CREATE UNIQUE INDEX media_filename_2_idx ON public.media USING btree (filename);

CREATE INDEX media_updated_at_2_idx ON public.media USING btree (updated_at);

CREATE INDEX pages_blocks_hero_background_image_1_idx ON public.pages_blocks_hero USING btree (background_image_id);

CREATE INDEX pages_blocks_hero_order_idx ON public.pages_blocks_hero USING btree (_order);

CREATE INDEX pages_blocks_hero_parent_id_idx ON public.pages_blocks_hero USING btree (_parent_id);

CREATE INDEX pages_blocks_hero_path_idx ON public.pages_blocks_hero USING btree (_path);

CREATE UNIQUE INDEX pages_blocks_hero_pkey ON public.pages_blocks_hero USING btree (id);

CREATE INDEX pages_blocks_two_column_image_1_idx ON public.pages_blocks_two_column USING btree (image_id);

CREATE INDEX pages_blocks_two_column_order_idx ON public.pages_blocks_two_column USING btree (_order);

CREATE INDEX pages_blocks_two_column_parent_id_idx ON public.pages_blocks_two_column USING btree (_parent_id);

CREATE INDEX pages_blocks_two_column_path_idx ON public.pages_blocks_two_column USING btree (_path);

CREATE UNIQUE INDEX pages_blocks_two_column_pkey ON public.pages_blocks_two_column USING btree (id);

CREATE INDEX pages_created_at_2_idx ON public.pages USING btree (created_at);

CREATE UNIQUE INDEX pages_pkey ON public.pages USING btree (id);

CREATE INDEX pages_updated_at_2_idx ON public.pages USING btree (updated_at);

CREATE INDEX payload_locked_documents_created_at_2_idx ON public.payload_locked_documents USING btree (created_at);

CREATE INDEX payload_locked_documents_global_slug_2_idx ON public.payload_locked_documents USING btree (global_slug);

CREATE INDEX payload_locked_documents_rels_media_id_2_idx ON public.payload_locked_documents_rels USING btree (media_id);

CREATE INDEX payload_locked_documents_rels_pages_id_2_idx ON public.payload_locked_documents_rels USING btree (pages_id);

CREATE INDEX payload_locked_documents_rels_users_id_2_idx ON public.payload_locked_documents_rels USING btree (users_id);

CREATE INDEX payload_locked_documents_updated_at_2_idx ON public.payload_locked_documents USING btree (updated_at);

CREATE INDEX payload_migrations_created_at_2_idx ON public.payload_migrations USING btree (created_at);

CREATE INDEX payload_migrations_updated_at_2_idx ON public.payload_migrations USING btree (updated_at);

CREATE INDEX payload_preferences_created_at_2_idx ON public.payload_preferences USING btree (created_at);

CREATE INDEX payload_preferences_key_2_idx ON public.payload_preferences USING btree (key);

CREATE INDEX payload_preferences_rels_users_id_2_idx ON public.payload_preferences_rels USING btree (users_id);

CREATE INDEX payload_preferences_updated_at_2_idx ON public.payload_preferences USING btree (updated_at);

CREATE INDEX users_created_at_2_idx ON public.users USING btree (created_at);

CREATE UNIQUE INDEX users_email_2_idx ON public.users USING btree (email);

CREATE INDEX users_updated_at_2_idx ON public.users USING btree (updated_at);

alter table "public"."pages" add constraint "pages_pkey" PRIMARY KEY using index "pages_pkey";

alter table "public"."pages_blocks_hero" add constraint "pages_blocks_hero_pkey" PRIMARY KEY using index "pages_blocks_hero_pkey";

alter table "public"."pages_blocks_two_column" add constraint "pages_blocks_two_column_pkey" PRIMARY KEY using index "pages_blocks_two_column_pkey";

alter table "public"."pages_blocks_hero" add constraint "pages_blocks_hero_background_image_id_media_id_fk" FOREIGN KEY (background_image_id) REFERENCES media(id) ON DELETE SET NULL not valid;

alter table "public"."pages_blocks_hero" validate constraint "pages_blocks_hero_background_image_id_media_id_fk";

alter table "public"."pages_blocks_hero" add constraint "pages_blocks_hero_parent_id_fk" FOREIGN KEY (_parent_id) REFERENCES pages(id) ON DELETE CASCADE not valid;

alter table "public"."pages_blocks_hero" validate constraint "pages_blocks_hero_parent_id_fk";

alter table "public"."pages_blocks_two_column" add constraint "pages_blocks_two_column_image_id_media_id_fk" FOREIGN KEY (image_id) REFERENCES media(id) ON DELETE SET NULL not valid;

alter table "public"."pages_blocks_two_column" validate constraint "pages_blocks_two_column_image_id_media_id_fk";

alter table "public"."pages_blocks_two_column" add constraint "pages_blocks_two_column_parent_id_fk" FOREIGN KEY (_parent_id) REFERENCES pages(id) ON DELETE CASCADE not valid;

alter table "public"."pages_blocks_two_column" validate constraint "pages_blocks_two_column_parent_id_fk";

alter table "public"."payload_locked_documents_rels" add constraint "payload_locked_documents_rels_pages_fk" FOREIGN KEY (pages_id) REFERENCES pages(id) ON DELETE CASCADE not valid;

alter table "public"."payload_locked_documents_rels" validate constraint "payload_locked_documents_rels_pages_fk";

grant delete on table "public"."pages" to "anon";

grant insert on table "public"."pages" to "anon";

grant references on table "public"."pages" to "anon";

grant select on table "public"."pages" to "anon";

grant trigger on table "public"."pages" to "anon";

grant truncate on table "public"."pages" to "anon";

grant update on table "public"."pages" to "anon";

grant delete on table "public"."pages" to "authenticated";

grant insert on table "public"."pages" to "authenticated";

grant references on table "public"."pages" to "authenticated";

grant select on table "public"."pages" to "authenticated";

grant trigger on table "public"."pages" to "authenticated";

grant truncate on table "public"."pages" to "authenticated";

grant update on table "public"."pages" to "authenticated";

grant delete on table "public"."pages" to "service_role";

grant insert on table "public"."pages" to "service_role";

grant references on table "public"."pages" to "service_role";

grant select on table "public"."pages" to "service_role";

grant trigger on table "public"."pages" to "service_role";

grant truncate on table "public"."pages" to "service_role";

grant update on table "public"."pages" to "service_role";

grant delete on table "public"."pages_blocks_hero" to "anon";

grant insert on table "public"."pages_blocks_hero" to "anon";

grant references on table "public"."pages_blocks_hero" to "anon";

grant select on table "public"."pages_blocks_hero" to "anon";

grant trigger on table "public"."pages_blocks_hero" to "anon";

grant truncate on table "public"."pages_blocks_hero" to "anon";

grant update on table "public"."pages_blocks_hero" to "anon";

grant delete on table "public"."pages_blocks_hero" to "authenticated";

grant insert on table "public"."pages_blocks_hero" to "authenticated";

grant references on table "public"."pages_blocks_hero" to "authenticated";

grant select on table "public"."pages_blocks_hero" to "authenticated";

grant trigger on table "public"."pages_blocks_hero" to "authenticated";

grant truncate on table "public"."pages_blocks_hero" to "authenticated";

grant update on table "public"."pages_blocks_hero" to "authenticated";

grant delete on table "public"."pages_blocks_hero" to "service_role";

grant insert on table "public"."pages_blocks_hero" to "service_role";

grant references on table "public"."pages_blocks_hero" to "service_role";

grant select on table "public"."pages_blocks_hero" to "service_role";

grant trigger on table "public"."pages_blocks_hero" to "service_role";

grant truncate on table "public"."pages_blocks_hero" to "service_role";

grant update on table "public"."pages_blocks_hero" to "service_role";

grant delete on table "public"."pages_blocks_two_column" to "anon";

grant insert on table "public"."pages_blocks_two_column" to "anon";

grant references on table "public"."pages_blocks_two_column" to "anon";

grant select on table "public"."pages_blocks_two_column" to "anon";

grant trigger on table "public"."pages_blocks_two_column" to "anon";

grant truncate on table "public"."pages_blocks_two_column" to "anon";

grant update on table "public"."pages_blocks_two_column" to "anon";

grant delete on table "public"."pages_blocks_two_column" to "authenticated";

grant insert on table "public"."pages_blocks_two_column" to "authenticated";

grant references on table "public"."pages_blocks_two_column" to "authenticated";

grant select on table "public"."pages_blocks_two_column" to "authenticated";

grant trigger on table "public"."pages_blocks_two_column" to "authenticated";

grant truncate on table "public"."pages_blocks_two_column" to "authenticated";

grant update on table "public"."pages_blocks_two_column" to "authenticated";

grant delete on table "public"."pages_blocks_two_column" to "service_role";

grant insert on table "public"."pages_blocks_two_column" to "service_role";

grant references on table "public"."pages_blocks_two_column" to "service_role";

grant select on table "public"."pages_blocks_two_column" to "service_role";

grant trigger on table "public"."pages_blocks_two_column" to "service_role";

grant truncate on table "public"."pages_blocks_two_column" to "service_role";

grant update on table "public"."pages_blocks_two_column" to "service_role";


