drop index if exists "public"."media_created_at_1_idx";

drop index if exists "public"."media_filename_1_idx";

drop index if exists "public"."media_updated_at_1_idx";

drop index if exists "public"."payload_locked_documents_created_at_1_idx";

drop index if exists "public"."payload_locked_documents_global_slug_1_idx";

drop index if exists "public"."payload_locked_documents_rels_media_id_1_idx";

drop index if exists "public"."payload_locked_documents_rels_users_id_1_idx";

drop index if exists "public"."payload_locked_documents_updated_at_1_idx";

drop index if exists "public"."payload_migrations_created_at_1_idx";

drop index if exists "public"."payload_migrations_updated_at_1_idx";

drop index if exists "public"."payload_preferences_created_at_1_idx";

drop index if exists "public"."payload_preferences_key_1_idx";

drop index if exists "public"."payload_preferences_rels_users_id_1_idx";

drop index if exists "public"."payload_preferences_updated_at_1_idx";

drop index if exists "public"."users_created_at_1_idx";

drop index if exists "public"."users_email_1_idx";

drop index if exists "public"."users_updated_at_1_idx";

alter table "public"."media" add column "prefix" character varying default 'media'::character varying;

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


