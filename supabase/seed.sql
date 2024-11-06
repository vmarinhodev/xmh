

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";





SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."media" (
    "id" integer NOT NULL,
    "alt" character varying NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "url" character varying,
    "thumbnail_u_r_l" character varying,
    "filename" character varying,
    "mime_type" character varying,
    "filesize" numeric,
    "width" numeric,
    "height" numeric,
    "focal_x" numeric,
    "focal_y" numeric
);


ALTER TABLE "public"."media" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."media_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."media_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."media_id_seq" OWNED BY "public"."media"."id";



CREATE TABLE IF NOT EXISTS "public"."payload_locked_documents" (
    "id" integer NOT NULL,
    "global_slug" character varying,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."payload_locked_documents" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."payload_locked_documents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."payload_locked_documents_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."payload_locked_documents_id_seq" OWNED BY "public"."payload_locked_documents"."id";



CREATE TABLE IF NOT EXISTS "public"."payload_locked_documents_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" integer NOT NULL,
    "path" character varying NOT NULL,
    "users_id" integer,
    "media_id" integer
);


ALTER TABLE "public"."payload_locked_documents_rels" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."payload_locked_documents_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."payload_locked_documents_rels_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."payload_locked_documents_rels_id_seq" OWNED BY "public"."payload_locked_documents_rels"."id";



CREATE TABLE IF NOT EXISTS "public"."payload_migrations" (
    "id" integer NOT NULL,
    "name" character varying,
    "batch" numeric,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."payload_migrations" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."payload_migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."payload_migrations_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."payload_migrations_id_seq" OWNED BY "public"."payload_migrations"."id";



CREATE TABLE IF NOT EXISTS "public"."payload_preferences" (
    "id" integer NOT NULL,
    "key" character varying,
    "value" "jsonb",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."payload_preferences" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."payload_preferences_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."payload_preferences_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."payload_preferences_id_seq" OWNED BY "public"."payload_preferences"."id";



CREATE TABLE IF NOT EXISTS "public"."payload_preferences_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" integer NOT NULL,
    "path" character varying NOT NULL,
    "users_id" integer
);


ALTER TABLE "public"."payload_preferences_rels" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."payload_preferences_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."payload_preferences_rels_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."payload_preferences_rels_id_seq" OWNED BY "public"."payload_preferences_rels"."id";



CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" integer NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "email" character varying NOT NULL,
    "reset_password_token" character varying,
    "reset_password_expiration" timestamp(3) with time zone,
    "salt" character varying,
    "hash" character varying,
    "login_attempts" numeric DEFAULT 0,
    "lock_until" timestamp(3) with time zone
);


ALTER TABLE "public"."users" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."users_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";



ALTER TABLE ONLY "public"."media" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."media_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."payload_locked_documents" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."payload_locked_documents_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."payload_locked_documents_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."payload_locked_documents_rels_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."payload_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."payload_migrations_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."payload_preferences" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."payload_preferences_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."payload_preferences_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."payload_preferences_rels_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."media"
    ADD CONSTRAINT "media_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payload_locked_documents"
    ADD CONSTRAINT "payload_locked_documents_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payload_migrations"
    ADD CONSTRAINT "payload_migrations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payload_preferences"
    ADD CONSTRAINT "payload_preferences_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");



CREATE INDEX "media_created_at_idx" ON "public"."media" USING "btree" ("created_at");



CREATE UNIQUE INDEX "media_filename_idx" ON "public"."media" USING "btree" ("filename");



CREATE INDEX "media_updated_at_idx" ON "public"."media" USING "btree" ("updated_at");



CREATE INDEX "payload_locked_documents_created_at_idx" ON "public"."payload_locked_documents" USING "btree" ("created_at");



CREATE INDEX "payload_locked_documents_global_slug_idx" ON "public"."payload_locked_documents" USING "btree" ("global_slug");



CREATE INDEX "payload_locked_documents_rels_media_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("media_id");



CREATE INDEX "payload_locked_documents_rels_order_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("order");



CREATE INDEX "payload_locked_documents_rels_parent_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("parent_id");



CREATE INDEX "payload_locked_documents_rels_path_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("path");



CREATE INDEX "payload_locked_documents_rels_users_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("users_id");



CREATE INDEX "payload_locked_documents_updated_at_idx" ON "public"."payload_locked_documents" USING "btree" ("updated_at");



CREATE INDEX "payload_migrations_created_at_idx" ON "public"."payload_migrations" USING "btree" ("created_at");



CREATE INDEX "payload_migrations_updated_at_idx" ON "public"."payload_migrations" USING "btree" ("updated_at");



CREATE INDEX "payload_preferences_created_at_idx" ON "public"."payload_preferences" USING "btree" ("created_at");



CREATE INDEX "payload_preferences_key_idx" ON "public"."payload_preferences" USING "btree" ("key");



CREATE INDEX "payload_preferences_rels_order_idx" ON "public"."payload_preferences_rels" USING "btree" ("order");



CREATE INDEX "payload_preferences_rels_parent_idx" ON "public"."payload_preferences_rels" USING "btree" ("parent_id");



CREATE INDEX "payload_preferences_rels_path_idx" ON "public"."payload_preferences_rels" USING "btree" ("path");



CREATE INDEX "payload_preferences_rels_users_id_idx" ON "public"."payload_preferences_rels" USING "btree" ("users_id");



CREATE INDEX "payload_preferences_updated_at_idx" ON "public"."payload_preferences" USING "btree" ("updated_at");



CREATE INDEX "users_created_at_idx" ON "public"."users" USING "btree" ("created_at");



CREATE UNIQUE INDEX "users_email_idx" ON "public"."users" USING "btree" ("email");



CREATE INDEX "users_updated_at_idx" ON "public"."users" USING "btree" ("updated_at");



ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_media_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_locked_documents"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_preferences"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



































































































































































































GRANT ALL ON TABLE "public"."media" TO "anon";
GRANT ALL ON TABLE "public"."media" TO "authenticated";
GRANT ALL ON TABLE "public"."media" TO "service_role";



GRANT ALL ON SEQUENCE "public"."media_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."media_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."media_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."payload_locked_documents" TO "anon";
GRANT ALL ON TABLE "public"."payload_locked_documents" TO "authenticated";
GRANT ALL ON TABLE "public"."payload_locked_documents" TO "service_role";



GRANT ALL ON SEQUENCE "public"."payload_locked_documents_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."payload_locked_documents_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."payload_locked_documents_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."payload_locked_documents_rels" TO "anon";
GRANT ALL ON TABLE "public"."payload_locked_documents_rels" TO "authenticated";
GRANT ALL ON TABLE "public"."payload_locked_documents_rels" TO "service_role";



GRANT ALL ON SEQUENCE "public"."payload_locked_documents_rels_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."payload_locked_documents_rels_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."payload_locked_documents_rels_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."payload_migrations" TO "anon";
GRANT ALL ON TABLE "public"."payload_migrations" TO "authenticated";
GRANT ALL ON TABLE "public"."payload_migrations" TO "service_role";



GRANT ALL ON SEQUENCE "public"."payload_migrations_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."payload_migrations_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."payload_migrations_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."payload_preferences" TO "anon";
GRANT ALL ON TABLE "public"."payload_preferences" TO "authenticated";
GRANT ALL ON TABLE "public"."payload_preferences" TO "service_role";



GRANT ALL ON SEQUENCE "public"."payload_preferences_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."payload_preferences_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."payload_preferences_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."payload_preferences_rels" TO "anon";
GRANT ALL ON TABLE "public"."payload_preferences_rels" TO "authenticated";
GRANT ALL ON TABLE "public"."payload_preferences_rels" TO "service_role";



GRANT ALL ON SEQUENCE "public"."payload_preferences_rels_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."payload_preferences_rels_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."payload_preferences_rels_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."users" TO "anon";
GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "service_role";



GRANT ALL ON SEQUENCE "public"."users_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."users_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."users_id_seq" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";






























RESET ALL;
