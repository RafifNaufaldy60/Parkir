--
-- PostgreSQL database dump
--

\restrict 92kxLH5TRVfyGXnzWmaaAimgkk7DkxSbdusf9f5fRhmZS0ib3vRM9NTuQWAgZA2

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Absensi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Absensi" (
    id_petugas integer,
    "Tanggal_absen" timestamp with time zone,
    "Kehadiran" character varying(255),
    nama_petugas character varying(255)
);


ALTER TABLE public."Absensi" OWNER TO postgres;

--
-- Name: Insiden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Insiden" (
    "ID_Rekaman" integer,
    waktu_rekaman character varying(255),
    keterangan character varying(255),
    tanggal_insiden timestamp with time zone,
    "NO_struk" integer
);


ALTER TABLE public."Insiden" OWNER TO postgres;

--
-- Name: Menjabat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Menjabat" (
    "ID_Petugas" integer,
    "ID_Jabatan" integer
);


ALTER TABLE public."Menjabat" OWNER TO postgres;

--
-- Name: jabatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jabatan (
    id_jabatan integer,
    nama_jabatan character varying(255),
    hak_akses text,
    "Gaji_Pokok" double precision
);


ALTER TABLE public.jabatan OWNER TO postgres;

--
-- Name: jadwal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jadwal (
    "NO_struk" integer,
    tanggal timestamp with time zone,
    jam_masuk character varying(255),
    jam_keluar character varying(255),
    id_petugas integer,
    plat_nomor character varying(255),
    bayar character varying(255),
    no_pintu integer,
    nama_petugas character varying(255)
);


ALTER TABLE public.jadwal OWNER TO postgres;

--
-- Name: kendaraan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kendaraan (
    plat_nomor character varying(255),
    "Jenis_Kendaraan" text
);


ALTER TABLE public.kendaraan OWNER TO postgres;

--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    "Username" character varying(255),
    "Password" character varying(255)
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: lokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lokasi (
    lantai integer,
    no_tempat integer,
    "Ketersediaan" character varying(255)
);


ALTER TABLE public.lokasi OWNER TO postgres;

--
-- Name: petugas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.petugas (
    id_petugas integer,
    id_jabatan integer,
    nama_petugas character varying(255)
);


ALTER TABLE public.petugas OWNER TO postgres;

--
-- Name: pintu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pintu (
    no_pintu integer,
    "Jenis_pintu" character varying(255),
    no_tempat integer
);


ALTER TABLE public.pintu OWNER TO postgres;

--
-- Name: rekap_absen; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.rekap_absen AS
 SELECT nama_petugas,
    count(*) AS hadir
   FROM public."Absensi"
  WHERE (("Kehadiran")::text = 'Hadir'::text)
  GROUP BY nama_petugas;


ALTER VIEW public.rekap_absen OWNER TO postgres;

--
-- Data for Name: Absensi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Absensi" (id_petugas, "Tanggal_absen", "Kehadiran", nama_petugas) FROM stdin;
5	2025-06-02 00:00:00+07	Hadir	Bayu Angkas
1	2025-07-01 00:00:00+07	Hadir	Budi Santoso
1	2025-05-05 00:00:00+07	Izin	Budi Santoso
1	2025-05-06 00:00:00+07	Hadir	Budi Santoso
1	2025-05-07 00:00:00+07	Hadir	Budi Santoso
1	2025-05-08 00:00:00+07	Hadir	Budi Santoso
1	2025-05-09 00:00:00+07	Hadir	Budi Santoso
1	2025-05-14 00:00:00+07	Izin	Budi Santoso
1	2025-05-15 00:00:00+07	Hadir	Budi Santoso
1	2025-05-16 00:00:00+07	Hadir	Budi Santoso
1	2025-05-19 00:00:00+07	Hadir	Budi Santoso
1	2025-05-20 00:00:00+07	Hadir	Budi Santoso
1	2025-05-21 00:00:00+07	Hadir	Budi Santoso
1	2025-05-22 00:00:00+07	Hadir	Budi Santoso
1	2025-05-23 00:00:00+07	Hadir	Budi Santoso
1	2025-05-26 00:00:00+07	Hadir	Budi Santoso
1	2025-05-27 00:00:00+07	Hadir	Budi Santoso
1	2025-05-28 00:00:00+07	Hadir	Budi Santoso
2	2025-05-01 00:00:00+07	Hadir	Siti Aminah
2	2025-05-05 00:00:00+07	Hadir	Siti Aminah
2	2025-05-06 00:00:00+07	Hadir	Siti Aminah
2	2025-05-07 00:00:00+07	Hadir	Siti Aminah
2	2025-05-08 00:00:00+07	Hadir	Siti Aminah
2	2025-05-09 00:00:00+07	Sakit	Siti Aminah
2	2025-05-14 00:00:00+07	Alpha	Siti Aminah
2	2025-05-15 00:00:00+07	Hadir	Siti Aminah
2	2025-05-16 00:00:00+07	Hadir	Siti Aminah
2	2025-05-19 00:00:00+07	Hadir	Siti Aminah
2	2025-05-20 00:00:00+07	Hadir	Siti Aminah
2	2025-05-21 00:00:00+07	Hadir	Siti Aminah
2	2025-05-22 00:00:00+07	Hadir	Siti Aminah
2	2025-05-23 00:00:00+07	Hadir	Siti Aminah
2	2025-05-26 00:00:00+07	Hadir	Siti Aminah
2	2025-05-27 00:00:00+07	Hadir	Siti Aminah
2	2025-05-28 00:00:00+07	Izin	Siti Aminah
3	2025-05-01 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-02 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-05 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-06 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-07 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-08 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-09 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-14 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-15 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-16 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-19 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-20 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-21 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-22 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-23 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-26 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-27 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-28 00:00:00+07	Hadir	Andi Wijaya
4	2025-05-01 00:00:00+07	Sakit	Dayu Prakoso
4	2025-05-02 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-05 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-06 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-07 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-08 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-09 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-14 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-15 00:00:00+07	Alpha	Dayu Prakoso
4	2025-05-16 00:00:00+07	Alpha	Dayu Prakoso
4	2025-05-19 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-20 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-21 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-22 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-23 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-26 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-27 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-28 00:00:00+07	Hadir	Dayu Prakoso
5	2025-05-01 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-02 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-05 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-06 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-07 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-08 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-09 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-14 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-15 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-16 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-19 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-20 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-21 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-22 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-23 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-26 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-27 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-28 00:00:00+07	Hadir	Bayu Angkas
6	2025-05-01 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-02 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-05 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-06 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-07 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-08 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-09 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-14 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-15 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-16 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-19 00:00:00+07	Sakit	Dewi Lestari
6	2025-05-20 00:00:00+07	Sakit	Dewi Lestari
6	2025-05-21 00:00:00+07	Sakit	Dewi Lestari
6	2025-05-22 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-23 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-26 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-27 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-28 00:00:00+07	Hadir	Dewi Lestari
7	2025-05-01 00:00:00+07	Hadir	Rina Marlina
7	2025-05-02 00:00:00+07	Hadir	Rina Marlina
7	2025-05-05 00:00:00+07	Hadir	Rina Marlina
7	2025-05-06 00:00:00+07	Hadir	Rina Marlina
7	2025-05-07 00:00:00+07	Hadir	Rina Marlina
7	2025-05-08 00:00:00+07	Hadir	Rina Marlina
7	2025-05-09 00:00:00+07	Hadir	Rina Marlina
7	2025-05-14 00:00:00+07	Hadir	Rina Marlina
7	2025-05-15 00:00:00+07	Alpha	Rina Marlina
7	2025-05-16 00:00:00+07	Hadir	Rina Marlina
7	2025-05-19 00:00:00+07	Hadir	Rina Marlina
7	2025-05-20 00:00:00+07	Hadir	Rina Marlina
7	2025-05-21 00:00:00+07	Hadir	Rina Marlina
7	2025-05-22 00:00:00+07	Hadir	Rina Marlina
7	2025-05-23 00:00:00+07	Hadir	Rina Marlina
7	2025-05-26 00:00:00+07	Hadir	Rina Marlina
7	2025-05-27 00:00:00+07	Hadir	Rina Marlina
7	2025-05-28 00:00:00+07	Hadir	Rina Marlina
8	2025-05-01 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-02 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-05 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-06 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-07 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-08 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-09 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-14 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-15 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-16 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-19 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-20 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-21 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-22 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-23 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-26 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-27 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-28 00:00:00+07	Hadir	Rizky Hidayat
1	2025-06-02 00:00:00+07	Hadir	Budi Santoso
1	2025-06-02 00:00:00+07	Izin	Budi Santoso
1	2025-06-03 00:00:00+07	Hadir	Budi Santoso
1	2025-06-02 00:00:00+07	Hadir	Budi Santoso
1	2025-06-03 00:00:00+07	Hadir	Budi Santoso
1	2025-06-04 00:00:00+07	Hadir	Budi Santoso
1	2025-06-05 00:00:00+07	Hadir	Budi Santoso
1	2025-06-11 00:00:00+07	Hadir	Budi Santoso
1	2025-06-12 00:00:00+07	Hadir	Budi Santoso
1	2025-06-13 00:00:00+07	Hadir	Budi Santoso
1	2025-06-16 00:00:00+07	Izin	Budi Santoso
1	2025-06-17 00:00:00+07	Alpha	Budi Santoso
1	2025-06-18 00:00:00+07	Hadir	Budi Santoso
1	2025-06-19 00:00:00+07	Hadir	Budi Santoso
1	2025-06-20 00:00:00+07	Hadir	Budi Santoso
1	2025-06-23 00:00:00+07	Hadir	Budi Santoso
1	2025-06-24 00:00:00+07	Hadir	Budi Santoso
1	2025-06-25 00:00:00+07	Hadir	Budi Santoso
1	2025-06-26 00:00:00+07	Alpha	Budi Santoso
1	2025-06-27 00:00:00+07	Hadir	Budi Santoso
1	2025-06-30 00:00:00+07	Hadir	Budi Santoso
2	2025-06-02 00:00:00+07	Hadir	Siti Aminah
2	2025-06-03 00:00:00+07	Hadir	Siti Aminah
2	2025-06-04 00:00:00+07	Hadir	Siti Aminah
2	2025-06-05 00:00:00+07	Hadir	Siti Aminah
2	2025-06-11 00:00:00+07	Hadir	Siti Aminah
2	2025-06-12 00:00:00+07	Hadir	Siti Aminah
2	2025-06-13 00:00:00+07	Hadir	Siti Aminah
2	2025-06-16 00:00:00+07	Hadir	Siti Aminah
2	2025-06-17 00:00:00+07	Hadir	Siti Aminah
2	2025-06-18 00:00:00+07	Sakit	Siti Aminah
2	2025-06-19 00:00:00+07	Sakit	Siti Aminah
2	2025-06-20 00:00:00+07	Sakit	Siti Aminah
2	2025-06-23 00:00:00+07	Hadir	Siti Aminah
2	2025-06-24 00:00:00+07	Hadir	Siti Aminah
2	2025-06-25 00:00:00+07	Hadir	Siti Aminah
2	2025-06-26 00:00:00+07	Hadir	Siti Aminah
2	2025-06-27 00:00:00+07	Hadir	Siti Aminah
2	2025-06-30 00:00:00+07	Hadir	Siti Aminah
3	2025-06-02 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-04 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-05 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-11 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-12 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-13 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-16 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-17 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-18 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-19 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-20 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-23 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-24 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-25 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-26 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-28 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-30 00:00:00+07	Hadir	Andi Wijaya
4	2025-06-02 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-03 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-05 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-11 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-12 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-13 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-16 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-17 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-18 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-19 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-20 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-23 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-24 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-25 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-26 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-27 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-30 00:00:00+07	Hadir	Dayu Prakoso
5	2025-06-03 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-04 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-05 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-11 00:00:00+07	Izin	Bayu Angkas
5	2025-06-12 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-13 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-16 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-17 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-18 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-19 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-20 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-23 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-24 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-25 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-26 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-27 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-30 00:00:00+07	Hadir	Bayu Angkas
6	2025-06-02 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-03 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-04 00:00:00+07	Izin	Dewi Lestari
6	2025-06-05 00:00:00+07	Izin	Dewi Lestari
6	2025-06-11 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-12 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-13 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-16 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-17 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-18 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-19 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-20 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-23 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-24 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-25 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-26 00:00:00+07	Sakit	Dewi Lestari
6	2025-06-27 00:00:00+07	Sakit	Dewi Lestari
6	2025-06-30 00:00:00+07	Hadir	Dewi Lestari
7	2025-06-02 00:00:00+07	Hadir	Rina Marlina
7	2025-06-03 00:00:00+07	Hadir	Rina Marlina
7	2025-06-04 00:00:00+07	Hadir	Rina Marlina
7	2025-06-05 00:00:00+07	Hadir	Rina Marlina
7	2025-06-11 00:00:00+07	Hadir	Rina Marlina
7	2025-06-12 00:00:00+07	Hadir	Rina Marlina
7	2025-06-13 00:00:00+07	Hadir	Rina Marlina
7	2025-06-16 00:00:00+07	Hadir	Rina Marlina
7	2025-06-17 00:00:00+07	Hadir	Rina Marlina
7	2025-06-18 00:00:00+07	Hadir	Rina Marlina
7	2025-06-19 00:00:00+07	Hadir	Rina Marlina
7	2025-06-20 00:00:00+07	Hadir	Rina Marlina
7	2025-06-23 00:00:00+07	Hadir	Rina Marlina
7	2025-06-24 00:00:00+07	Hadir	Rina Marlina
7	2025-06-25 00:00:00+07	Hadir	Rina Marlina
7	2025-06-26 00:00:00+07	Hadir	Rina Marlina
7	2025-06-27 00:00:00+07	Hadir	Rina Marlina
7	2025-06-30 00:00:00+07	Hadir	Rina Marlina
8	2025-06-02 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-03 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-04 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-05 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-11 00:00:00+07	Sakit	Rizky Hidayat
8	2025-06-12 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-13 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-16 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-17 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-18 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-19 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-20 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-23 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-24 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-25 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-26 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-27 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-30 00:00:00+07	Hadir	Rizky Hidayat
9	2025-05-02 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-05 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-06 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-07 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-08 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-09 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-14 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-15 00:00:00+07	Izin	Fajar Kurniawan
9	2025-05-16 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-19 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-20 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-21 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-22 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-23 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-26 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-27 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-28 00:00:00+07	Hadir	Fajar Kurniawan
10	2025-05-02 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-05 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-06 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-07 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-08 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-09 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-14 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-15 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-16 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-19 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-20 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-21 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-22 00:00:00+07	Izin	Agus Setiawan
10	2025-05-23 00:00:00+07	Izin	Agus Setiawan
10	2025-05-26 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-27 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-28 00:00:00+07	Hadir	Agus Setiawan
11	2025-05-02 00:00:00+07	Hadir	Surya Putra
11	2025-05-05 00:00:00+07	Hadir	Surya Putra
11	2025-05-06 00:00:00+07	Hadir	Surya Putra
11	2025-05-07 00:00:00+07	Hadir	Surya Putra
11	2025-05-08 00:00:00+07	Hadir	Surya Putra
11	2025-05-09 00:00:00+07	Hadir	Surya Putra
11	2025-05-14 00:00:00+07	Hadir	Surya Putra
11	2025-05-15 00:00:00+07	Hadir	Surya Putra
11	2025-05-16 00:00:00+07	Hadir	Surya Putra
11	2025-05-19 00:00:00+07	Hadir	Surya Putra
11	2025-05-20 00:00:00+07	Hadir	Surya Putra
11	2025-05-21 00:00:00+07	Hadir	Surya Putra
11	2025-05-22 00:00:00+07	Hadir	Surya Putra
11	2025-05-23 00:00:00+07	Sakit	Surya Putra
11	2025-05-26 00:00:00+07	Sakit	Surya Putra
11	2025-05-27 00:00:00+07	Hadir	Surya Putra
11	2025-05-28 00:00:00+07	Hadir	Surya Putra
12	2025-05-02 00:00:00+07	Hadir	Sukri Purnama
12	2025-06-09 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-06 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-07 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-08 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-09 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-15 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-16 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-14 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-19 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-20 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-21 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-22 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-23 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-26 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-27 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-28 00:00:00+07	Hadir	Sukri Purnama
13	2025-05-02 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-05 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-06 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-07 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-08 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-09 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-14 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-15 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-16 00:00:00+07	Sakit	Ucok Tanugi
13	2025-05-19 00:00:00+07	Sakit	Ucok Tanugi
13	2025-05-20 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-21 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-22 00:00:00+07	Alpha	Ucok Tanugi
13	2025-05-23 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-26 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-27 00:00:00+07	Hadir	Ucok Tanugi
5	2025-06-02 00:00:00+07	Hadir	Bayu Angkas
1	2025-07-01 00:00:00+07	Hadir	Budi Santoso
1	2025-05-05 00:00:00+07	Izin	Budi Santoso
1	2025-05-06 00:00:00+07	Hadir	Budi Santoso
1	2025-05-07 00:00:00+07	Hadir	Budi Santoso
1	2025-05-08 00:00:00+07	Hadir	Budi Santoso
1	2025-05-09 00:00:00+07	Hadir	Budi Santoso
1	2025-05-14 00:00:00+07	Izin	Budi Santoso
1	2025-05-15 00:00:00+07	Hadir	Budi Santoso
1	2025-05-16 00:00:00+07	Hadir	Budi Santoso
1	2025-05-19 00:00:00+07	Hadir	Budi Santoso
1	2025-05-20 00:00:00+07	Hadir	Budi Santoso
1	2025-05-21 00:00:00+07	Hadir	Budi Santoso
1	2025-05-22 00:00:00+07	Hadir	Budi Santoso
1	2025-05-23 00:00:00+07	Hadir	Budi Santoso
1	2025-05-26 00:00:00+07	Hadir	Budi Santoso
1	2025-05-27 00:00:00+07	Hadir	Budi Santoso
1	2025-05-28 00:00:00+07	Hadir	Budi Santoso
2	2025-05-01 00:00:00+07	Hadir	Siti Aminah
2	2025-05-05 00:00:00+07	Hadir	Siti Aminah
2	2025-05-06 00:00:00+07	Hadir	Siti Aminah
2	2025-05-07 00:00:00+07	Hadir	Siti Aminah
2	2025-05-08 00:00:00+07	Hadir	Siti Aminah
2	2025-05-09 00:00:00+07	Sakit	Siti Aminah
2	2025-05-14 00:00:00+07	Alpha	Siti Aminah
2	2025-05-15 00:00:00+07	Hadir	Siti Aminah
2	2025-05-16 00:00:00+07	Hadir	Siti Aminah
2	2025-05-19 00:00:00+07	Hadir	Siti Aminah
2	2025-05-20 00:00:00+07	Hadir	Siti Aminah
2	2025-05-21 00:00:00+07	Hadir	Siti Aminah
2	2025-05-22 00:00:00+07	Hadir	Siti Aminah
2	2025-05-23 00:00:00+07	Hadir	Siti Aminah
2	2025-05-26 00:00:00+07	Hadir	Siti Aminah
2	2025-05-27 00:00:00+07	Hadir	Siti Aminah
2	2025-05-28 00:00:00+07	Izin	Siti Aminah
3	2025-05-01 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-02 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-05 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-06 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-07 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-08 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-09 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-14 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-15 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-16 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-19 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-20 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-21 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-22 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-23 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-26 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-27 00:00:00+07	Hadir	Andi Wijaya
3	2025-05-28 00:00:00+07	Hadir	Andi Wijaya
4	2025-05-01 00:00:00+07	Sakit	Dayu Prakoso
4	2025-05-02 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-05 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-06 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-07 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-08 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-09 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-14 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-15 00:00:00+07	Alpha	Dayu Prakoso
4	2025-05-16 00:00:00+07	Alpha	Dayu Prakoso
4	2025-05-19 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-20 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-21 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-22 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-23 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-26 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-27 00:00:00+07	Hadir	Dayu Prakoso
4	2025-05-28 00:00:00+07	Hadir	Dayu Prakoso
5	2025-05-01 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-02 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-05 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-06 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-07 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-08 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-09 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-14 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-15 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-16 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-19 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-20 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-21 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-22 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-23 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-26 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-27 00:00:00+07	Hadir	Bayu Angkas
5	2025-05-28 00:00:00+07	Hadir	Bayu Angkas
6	2025-05-01 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-02 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-05 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-06 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-07 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-08 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-09 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-14 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-15 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-16 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-19 00:00:00+07	Sakit	Dewi Lestari
6	2025-05-20 00:00:00+07	Sakit	Dewi Lestari
6	2025-05-21 00:00:00+07	Sakit	Dewi Lestari
6	2025-05-22 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-23 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-26 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-27 00:00:00+07	Hadir	Dewi Lestari
6	2025-05-28 00:00:00+07	Hadir	Dewi Lestari
7	2025-05-01 00:00:00+07	Hadir	Rina Marlina
7	2025-05-02 00:00:00+07	Hadir	Rina Marlina
7	2025-05-05 00:00:00+07	Hadir	Rina Marlina
7	2025-05-06 00:00:00+07	Hadir	Rina Marlina
7	2025-05-07 00:00:00+07	Hadir	Rina Marlina
7	2025-05-08 00:00:00+07	Hadir	Rina Marlina
7	2025-05-09 00:00:00+07	Hadir	Rina Marlina
7	2025-05-14 00:00:00+07	Hadir	Rina Marlina
7	2025-05-15 00:00:00+07	Alpha	Rina Marlina
7	2025-05-16 00:00:00+07	Hadir	Rina Marlina
7	2025-05-19 00:00:00+07	Hadir	Rina Marlina
7	2025-05-20 00:00:00+07	Hadir	Rina Marlina
7	2025-05-21 00:00:00+07	Hadir	Rina Marlina
7	2025-05-22 00:00:00+07	Hadir	Rina Marlina
7	2025-05-23 00:00:00+07	Hadir	Rina Marlina
7	2025-05-26 00:00:00+07	Hadir	Rina Marlina
7	2025-05-27 00:00:00+07	Hadir	Rina Marlina
7	2025-05-28 00:00:00+07	Hadir	Rina Marlina
8	2025-05-01 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-02 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-05 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-06 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-07 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-08 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-09 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-14 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-15 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-16 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-19 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-20 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-21 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-22 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-23 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-26 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-27 00:00:00+07	Hadir	Rizky Hidayat
8	2025-05-28 00:00:00+07	Hadir	Rizky Hidayat
1	2025-06-02 00:00:00+07	Hadir	Budi Santoso
1	2025-06-02 00:00:00+07	Izin	Budi Santoso
1	2025-06-03 00:00:00+07	Hadir	Budi Santoso
1	2025-06-02 00:00:00+07	Hadir	Budi Santoso
1	2025-06-03 00:00:00+07	Hadir	Budi Santoso
1	2025-06-04 00:00:00+07	Hadir	Budi Santoso
1	2025-06-05 00:00:00+07	Hadir	Budi Santoso
1	2025-06-11 00:00:00+07	Hadir	Budi Santoso
1	2025-06-12 00:00:00+07	Hadir	Budi Santoso
1	2025-06-13 00:00:00+07	Hadir	Budi Santoso
1	2025-06-16 00:00:00+07	Izin	Budi Santoso
1	2025-06-17 00:00:00+07	Alpha	Budi Santoso
1	2025-06-18 00:00:00+07	Hadir	Budi Santoso
1	2025-06-19 00:00:00+07	Hadir	Budi Santoso
1	2025-06-20 00:00:00+07	Hadir	Budi Santoso
1	2025-06-23 00:00:00+07	Hadir	Budi Santoso
1	2025-06-24 00:00:00+07	Hadir	Budi Santoso
1	2025-06-25 00:00:00+07	Hadir	Budi Santoso
1	2025-06-26 00:00:00+07	Alpha	Budi Santoso
1	2025-06-27 00:00:00+07	Hadir	Budi Santoso
1	2025-06-30 00:00:00+07	Hadir	Budi Santoso
2	2025-06-02 00:00:00+07	Hadir	Siti Aminah
2	2025-06-03 00:00:00+07	Hadir	Siti Aminah
2	2025-06-04 00:00:00+07	Hadir	Siti Aminah
2	2025-06-05 00:00:00+07	Hadir	Siti Aminah
2	2025-06-11 00:00:00+07	Hadir	Siti Aminah
2	2025-06-12 00:00:00+07	Hadir	Siti Aminah
2	2025-06-13 00:00:00+07	Hadir	Siti Aminah
2	2025-06-16 00:00:00+07	Hadir	Siti Aminah
2	2025-06-17 00:00:00+07	Hadir	Siti Aminah
2	2025-06-18 00:00:00+07	Sakit	Siti Aminah
2	2025-06-19 00:00:00+07	Sakit	Siti Aminah
2	2025-06-20 00:00:00+07	Sakit	Siti Aminah
2	2025-06-23 00:00:00+07	Hadir	Siti Aminah
2	2025-06-24 00:00:00+07	Hadir	Siti Aminah
2	2025-06-25 00:00:00+07	Hadir	Siti Aminah
2	2025-06-26 00:00:00+07	Hadir	Siti Aminah
2	2025-06-27 00:00:00+07	Hadir	Siti Aminah
2	2025-06-30 00:00:00+07	Hadir	Siti Aminah
3	2025-06-02 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-04 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-05 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-11 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-12 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-13 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-16 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-17 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-18 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-19 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-20 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-23 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-24 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-25 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-26 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-28 00:00:00+07	Hadir	Andi Wijaya
3	2025-06-30 00:00:00+07	Hadir	Andi Wijaya
4	2025-06-02 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-03 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-05 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-11 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-12 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-13 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-16 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-17 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-18 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-19 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-20 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-23 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-24 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-25 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-26 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-27 00:00:00+07	Hadir	Dayu Prakoso
4	2025-06-30 00:00:00+07	Hadir	Dayu Prakoso
5	2025-06-03 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-04 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-05 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-11 00:00:00+07	Izin	Bayu Angkas
5	2025-06-12 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-13 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-16 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-17 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-18 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-19 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-20 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-23 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-24 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-25 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-26 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-27 00:00:00+07	Hadir	Bayu Angkas
5	2025-06-30 00:00:00+07	Hadir	Bayu Angkas
6	2025-06-02 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-03 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-04 00:00:00+07	Izin	Dewi Lestari
6	2025-06-05 00:00:00+07	Izin	Dewi Lestari
6	2025-06-11 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-12 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-13 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-16 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-17 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-18 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-19 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-20 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-23 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-24 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-25 00:00:00+07	Hadir	Dewi Lestari
6	2025-06-26 00:00:00+07	Sakit	Dewi Lestari
6	2025-06-27 00:00:00+07	Sakit	Dewi Lestari
6	2025-06-30 00:00:00+07	Hadir	Dewi Lestari
7	2025-06-02 00:00:00+07	Hadir	Rina Marlina
7	2025-06-03 00:00:00+07	Hadir	Rina Marlina
7	2025-06-04 00:00:00+07	Hadir	Rina Marlina
7	2025-06-05 00:00:00+07	Hadir	Rina Marlina
7	2025-06-11 00:00:00+07	Hadir	Rina Marlina
7	2025-06-12 00:00:00+07	Hadir	Rina Marlina
7	2025-06-13 00:00:00+07	Hadir	Rina Marlina
7	2025-06-16 00:00:00+07	Hadir	Rina Marlina
7	2025-06-17 00:00:00+07	Hadir	Rina Marlina
7	2025-06-18 00:00:00+07	Hadir	Rina Marlina
7	2025-06-19 00:00:00+07	Hadir	Rina Marlina
7	2025-06-20 00:00:00+07	Hadir	Rina Marlina
7	2025-06-23 00:00:00+07	Hadir	Rina Marlina
7	2025-06-24 00:00:00+07	Hadir	Rina Marlina
7	2025-06-25 00:00:00+07	Hadir	Rina Marlina
7	2025-06-26 00:00:00+07	Hadir	Rina Marlina
7	2025-06-27 00:00:00+07	Hadir	Rina Marlina
7	2025-06-30 00:00:00+07	Hadir	Rina Marlina
8	2025-06-02 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-03 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-04 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-05 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-11 00:00:00+07	Sakit	Rizky Hidayat
8	2025-06-12 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-13 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-16 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-17 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-18 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-19 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-20 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-23 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-24 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-25 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-26 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-27 00:00:00+07	Hadir	Rizky Hidayat
8	2025-06-30 00:00:00+07	Hadir	Rizky Hidayat
9	2025-05-02 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-05 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-06 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-07 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-08 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-09 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-14 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-15 00:00:00+07	Izin	Fajar Kurniawan
9	2025-05-16 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-19 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-20 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-21 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-22 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-23 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-26 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-27 00:00:00+07	Hadir	Fajar Kurniawan
9	2025-05-28 00:00:00+07	Hadir	Fajar Kurniawan
10	2025-05-02 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-05 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-06 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-07 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-08 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-09 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-14 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-15 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-16 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-19 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-20 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-21 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-22 00:00:00+07	Izin	Agus Setiawan
10	2025-05-23 00:00:00+07	Izin	Agus Setiawan
10	2025-05-26 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-27 00:00:00+07	Hadir	Agus Setiawan
10	2025-05-28 00:00:00+07	Hadir	Agus Setiawan
11	2025-05-02 00:00:00+07	Hadir	Surya Putra
11	2025-05-05 00:00:00+07	Hadir	Surya Putra
11	2025-05-06 00:00:00+07	Hadir	Surya Putra
11	2025-05-07 00:00:00+07	Hadir	Surya Putra
11	2025-05-08 00:00:00+07	Hadir	Surya Putra
11	2025-05-09 00:00:00+07	Hadir	Surya Putra
11	2025-05-14 00:00:00+07	Hadir	Surya Putra
11	2025-05-15 00:00:00+07	Hadir	Surya Putra
11	2025-05-16 00:00:00+07	Hadir	Surya Putra
11	2025-05-19 00:00:00+07	Hadir	Surya Putra
11	2025-05-20 00:00:00+07	Hadir	Surya Putra
11	2025-05-21 00:00:00+07	Hadir	Surya Putra
11	2025-05-22 00:00:00+07	Hadir	Surya Putra
11	2025-05-23 00:00:00+07	Sakit	Surya Putra
11	2025-05-26 00:00:00+07	Sakit	Surya Putra
11	2025-05-27 00:00:00+07	Hadir	Surya Putra
11	2025-05-28 00:00:00+07	Hadir	Surya Putra
12	2025-05-02 00:00:00+07	Hadir	Sukri Purnama
12	2025-06-09 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-06 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-07 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-08 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-09 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-15 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-16 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-14 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-19 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-20 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-21 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-22 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-23 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-26 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-27 00:00:00+07	Hadir	Sukri Purnama
12	2025-05-28 00:00:00+07	Hadir	Sukri Purnama
13	2025-05-02 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-05 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-06 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-07 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-08 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-09 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-14 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-15 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-16 00:00:00+07	Sakit	Ucok Tanugi
13	2025-05-19 00:00:00+07	Sakit	Ucok Tanugi
13	2025-05-20 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-21 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-22 00:00:00+07	Alpha	Ucok Tanugi
13	2025-05-23 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-26 00:00:00+07	Hadir	Ucok Tanugi
13	2025-05-27 00:00:00+07	Hadir	Ucok Tanugi
\.


--
-- Data for Name: Insiden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Insiden" ("ID_Rekaman", waktu_rekaman, keterangan, tanggal_insiden, "NO_struk") FROM stdin;
1	11.55	Kaca mobil pecah	2025-05-26 00:00:00+07	1121900
2	13.10	motor hilang	2025-05-01 00:00:00+07	1122000
3	09.22	Body kendaraan lecet	2025-05-14 00:00:00+07	1122100
1	11.55	Kaca mobil pecah	2025-05-26 00:00:00+07	1121900
2	13.10	motor hilang	2025-05-01 00:00:00+07	1122000
3	09.22	Body kendaraan lecet	2025-05-14 00:00:00+07	1122100
\.


--
-- Data for Name: Menjabat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Menjabat" ("ID_Petugas", "ID_Jabatan") FROM stdin;
1	1150
2	1160
3	1170
4	1180
5	1190
6	1200
7	1210
8	1220
9	1230
10	1240
11	1250
12	1260
13	1270
1	1150
2	1160
3	1170
4	1180
5	1190
6	1200
7	1210
8	1220
9	1230
10	1240
11	1250
12	1260
13	1270
\.


--
-- Data for Name: jabatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jabatan (id_jabatan, nama_jabatan, hak_akses, "Gaji_Pokok") FROM stdin;
1150	Petugas Parkir loket1	Mencetak struk parkir	2000000
1160	Operator CCTV	Memantau CCTV	2000000
1170	Supervisor Shift	Melihat data petugas dan jadwal	1500000
1180	Admin Sistem	Kelola semua data dan konfigurasi sistem parkir	1500000
1190	Petugas Parkir loket 2	Mencetak struk	2000000
1200	Petugas loket 3	Mencetak struk	2000000
1210	Petugas Loket 4	Mencetak struk	2000000
1220	Petugas Loket 5	Mencetak struk	2000000
1230	Petugas Loket 6	Mencetak struk	2000000
1240	Petugas Loket 7	Mencetak struk	2000000
1250	Petugas Loket 8	Mencetak struk	2000000
1260	Petugas loket 9	Mencetak struk	2000000
1270	Petugas loket 10	Mencetak struk	2000000
1150	Petugas Parkir loket1	Mencetak struk parkir	2000000
1160	Operator CCTV	Memantau CCTV	2000000
1170	Supervisor Shift	Melihat data petugas dan jadwal	1500000
1180	Admin Sistem	Kelola semua data dan konfigurasi sistem parkir	1500000
1190	Petugas Parkir loket 2	Mencetak struk	2000000
1200	Petugas loket 3	Mencetak struk	2000000
1210	Petugas Loket 4	Mencetak struk	2000000
1220	Petugas Loket 5	Mencetak struk	2000000
1230	Petugas Loket 6	Mencetak struk	2000000
1240	Petugas Loket 7	Mencetak struk	2000000
1250	Petugas Loket 8	Mencetak struk	2000000
1260	Petugas loket 9	Mencetak struk	2000000
1270	Petugas loket 10	Mencetak struk	2000000
1150	Petugas Parkir loket1	Mencetak struk parkir	2000000
1160	Operator CCTV	Memantau CCTV	2000000
1170	Supervisor Shift	Melihat data petugas dan jadwal	1500000
1180	Admin Sistem	Kelola semua data dan konfigurasi sistem parkir	1500000
1190	Petugas Parkir loket 2	Mencetak struk	2000000
1200	Petugas loket 3	Mencetak struk	2000000
1210	Petugas Loket 4	Mencetak struk	2000000
1220	Petugas Loket 5	Mencetak struk	2000000
1230	Petugas Loket 6	Mencetak struk	2000000
1240	Petugas Loket 7	Mencetak struk	2000000
1250	Petugas Loket 8	Mencetak struk	2000000
1260	Petugas loket 9	Mencetak struk	2000000
1270	Petugas loket 10	Mencetak struk	2000000
\.


--
-- Data for Name: jadwal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jadwal ("NO_struk", tanggal, jam_masuk, jam_keluar, id_petugas, plat_nomor, bayar, no_pintu, nama_petugas) FROM stdin;
112300	2025-06-10 00:00:00+07	12.40	\N	0	D 6665 OOI	\N	1	Sukri Purnama
1120600	2025-05-18 00:00:00+07	07.10	13.45	6	D 9088 GHY	Rp 10.000	2	Budi Santoso
1120900	2025-05-14 00:00:00+07	07.30	15.30	8	R 3345 DHC	Rp 5.000	6	Ucok Tanugi
1121000	2025-05-15 00:00:00+07	08.30	13.10	8	K 9980 HHG	Rp 5.000	8	Dewi Lestari
1121200	2025-05-16 00:00:00+07	06.30	14.50	6	AB 7710 OQG	Rp 5.000	10	Rina Marlina
1121300	2025-05-20 00:00:00+07	08.00	12.20	8	G 1122 UGQ	Rp 10.000	9	Sukri Purnama
1121500	2025-05-14 00:00:00+07	09.15	11.45	3	AE 9900 KJZ	Rp 10.000	3	Rizky Hidayat
1121600	2025-05-15 00:00:00+07	06.12	15.50	5	AG 5160 GGG	Rp 5.000	4	Budi Santoso
1121700	2025-05-21 00:00:00+07	07.44	14.12	7	F 2111 GGG	Rp 10.000	7	Rizky Hidayat
1121800	2025-06-02 00:00:00+07	07.37	11.30	5	B 1111 ABD	Rp 10.000	3	Rina Marlina
1121900	2025-05-26 00:00:00+07	10.22	\N	1	K 1010 LLZ	Rp 10.000	1	Bayu Angkas
1122000	2025-05-01 00:00:00+07	12.45	\N	6	AB 7676 PPO	Rp 5.000	5	Rina Marlina
1122200	2025-06-25 00:00:00+07	10.10	12.23	7	 S 9090 UUK	Rp 10.000	4	Rizky Hidayat
1122300	2025-06-02 00:00:00+07	07.31	\N	1	AE 2121 KWW	Rp 5.000	1	Fajar Kurniawan
1122400	2025-06-03 00:00:00+07	12.30	\N	3	G 3333 HHH	\N	3	Rizky Hidayat
1122500	2025-06-03 00:00:00+07	03.40	\N	1	G 7070 XXQ	\N	1	Bayu Angkas
1122600	2025-06-02 00:00:00+07	03.40	06.30	4	G 8899 LLS	Rp 10.000	12	Surya Putra
1122700	2025-06-05 00:00:00+07	12.30	13.00	4	S 3350 DDF	Rp 10.000	2	Rina Marlina
1122800	2025-06-09 00:00:00+07	12.33	13.40	13	AE 7777 YYY	Rp 10.000	2	Agus Setiawan
1122900	2025-06-09 00:00:00+07	14.30	\N	0	D 5553 NNN	\N	1	Ucok Tanugi
1123100	2025-06-09 00:00:00+07	11.20	\N	0	K 7778 CCC	\N	1	Surya Putra
1123200	\N	\N	\N	0	W 1212 TTR	\N	0	\N
1123300	\N	\N	\N	0	B 0909 III	\N	0	\N
112300	2025-06-10 00:00:00+07	12.40	\N	0	D 6665 OOI	\N	1	Sukri Purnama
1120600	2025-05-18 00:00:00+07	07.10	13.45	6	D 9088 GHY	Rp 10.000	2	Budi Santoso
1120900	2025-05-14 00:00:00+07	07.30	15.30	8	R 3345 DHC	Rp 5.000	6	Ucok Tanugi
1121000	2025-05-15 00:00:00+07	08.30	13.10	8	K 9980 HHG	Rp 5.000	8	Dewi Lestari
1121200	2025-05-16 00:00:00+07	06.30	14.50	6	AB 7710 OQG	Rp 5.000	10	Rina Marlina
1121300	2025-05-20 00:00:00+07	08.00	12.20	8	G 1122 UGQ	Rp 10.000	9	Sukri Purnama
1121500	2025-05-14 00:00:00+07	09.15	11.45	3	AE 9900 KJZ	Rp 10.000	3	Rizky Hidayat
1121600	2025-05-15 00:00:00+07	06.12	15.50	5	AG 5160 GGG	Rp 5.000	4	Budi Santoso
1121700	2025-05-21 00:00:00+07	07.44	14.12	7	F 2111 GGG	Rp 10.000	7	Rizky Hidayat
1121800	2025-06-02 00:00:00+07	07.37	11.30	5	B 1111 ABD	Rp 10.000	3	Rina Marlina
1121900	2025-05-26 00:00:00+07	10.22	\N	1	K 1010 LLZ	Rp 10.000	1	Bayu Angkas
1122000	2025-05-01 00:00:00+07	12.45	\N	6	AB 7676 PPO	Rp 5.000	5	Rina Marlina
1122200	2025-06-25 00:00:00+07	10.10	12.23	7	 S 9090 UUK	Rp 10.000	4	Rizky Hidayat
1122300	2025-06-02 00:00:00+07	07.31	\N	1	AE 2121 KWW	Rp 5.000	1	Fajar Kurniawan
1122400	2025-06-03 00:00:00+07	12.30	\N	3	G 3333 HHH	\N	3	Rizky Hidayat
1122500	2025-06-03 00:00:00+07	03.40	\N	1	G 7070 XXQ	\N	1	Bayu Angkas
1122600	2025-06-02 00:00:00+07	03.40	06.30	4	G 8899 LLS	Rp 10.000	12	Surya Putra
1122700	2025-06-05 00:00:00+07	12.30	13.00	4	S 3350 DDF	Rp 10.000	2	Rina Marlina
1122800	2025-06-09 00:00:00+07	12.33	13.40	13	AE 7777 YYY	Rp 10.000	2	Agus Setiawan
1122900	2025-06-09 00:00:00+07	14.30	\N	0	D 5553 NNN	\N	1	Ucok Tanugi
1123100	2025-06-09 00:00:00+07	11.20	\N	0	K 7778 CCC	\N	1	Surya Putra
1123200	\N	\N	\N	0	W 1212 TTR	\N	0	\N
1123300	\N	\N	\N	0	B 0909 III	\N	0	\N
\.


--
-- Data for Name: kendaraan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kendaraan (plat_nomor, "Jenis_Kendaraan") FROM stdin;
	\N
AB 7710 OQG	Roda 4
AE 3333 DGC	Roda 4
AE 7766 DGC	Roda 2
AE 7777 YYY	Roda 4
B 0909 III	Roda 4
B 1111 ABD	Roda 4
B 3367 ABC	Roda 4
D 5553 NNN	Roda 4
D 9088 GHY	Roda 4
F 2111 GGG	Roda 4
F 2456 GCG	Roda 4
G 1050 UIW	Roda 4
G 3333 HHH	Roda 4
G 7070 XXQ	Roda 4
G 8899 LLS	Roda 4
K 7778 CCC	Roda 4
K 9980 HHG	Roda 2
R 3345 DHC	Roda 2
S 3350 DDF	Roda 4
W 1212 TTR	Roda 4
	\N
AB 7710 OQG	Roda 4
AE 3333 DGC	Roda 4
AE 7766 DGC	Roda 2
AE 7777 YYY	Roda 4
B 0909 III	Roda 4
B 1111 ABD	Roda 4
B 3367 ABC	Roda 4
D 5553 NNN	Roda 4
D 9088 GHY	Roda 4
F 2111 GGG	Roda 4
F 2456 GCG	Roda 4
G 1050 UIW	Roda 4
G 3333 HHH	Roda 4
G 7070 XXQ	Roda 4
G 8899 LLS	Roda 4
K 7778 CCC	Roda 4
K 9980 HHG	Roda 2
R 3345 DHC	Roda 2
S 3350 DDF	Roda 4
W 1212 TTR	Roda 4
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login ("Username", "Password") FROM stdin;
Agus setiawan	guset
Andi wijaya	Wijayan
Bayu angkas	bayuang
Budi santoso	santoso
Dayu prakoso	dayuprak
Dewi lestari	Lestari
Fajar kurniawan	kurnia
Rina marlina	Rimar
Rizky hidayat	Hidayat
Siti aminah	Siami
Sukri purnama	sukri
Surya putra	surya
Ucok tanugi	tanugi
Agus setiawan	guset
Andi wijaya	Wijayan
Bayu angkas	bayuang
Budi santoso	santoso
Dayu prakoso	dayuprak
Dewi lestari	Lestari
Fajar kurniawan	kurnia
Rina marlina	Rimar
Rizky hidayat	Hidayat
Siti aminah	Siami
Sukri purnama	sukri
Surya putra	surya
Ucok tanugi	tanugi
\.


--
-- Data for Name: lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lokasi (lantai, no_tempat, "Ketersediaan") FROM stdin;
1	102	Kosong
1	105	Kosong
2	210	Kosong
2	220	Terisi
2	230	Terisi
2	240	Terisi
2	250	Terisi
2	260	Terisi
2	270	Terisi
2	280	Kosong
2	290	Kosong
3	300	Kosong
3	310	Terisi
3	320	Kosong
3	330	Terisi
3	340	Terisi
3	350	Terisi
3	360	Kosong
3	370	Kosong
3	380	Kosong
3	390	Kosong
1	102	Kosong
1	105	Kosong
2	210	Kosong
2	220	Terisi
2	230	Terisi
2	240	Terisi
2	250	Terisi
2	260	Terisi
2	270	Terisi
2	280	Kosong
2	290	Kosong
3	300	Kosong
3	310	Terisi
3	320	Kosong
3	330	Terisi
3	340	Terisi
3	350	Terisi
3	360	Kosong
3	370	Kosong
3	380	Kosong
3	390	Kosong
\.


--
-- Data for Name: petugas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.petugas (id_petugas, id_jabatan, nama_petugas) FROM stdin;
1	1150	Budi Santoso
2	1160	Siti Aminah
3	1170	Andi Wijaya
4	1180	Dayu Prakoso
5	1190	Bayu Angkas
6	1200	Dewi Lestari
7	1210	Rina Marlina
8	1220	Rizky Hidayat
9	1230	Fajar Kurniawam
10	1240	Agus Setiawan
11	1250	Surya Putra
12	1260	Sukri Purnama
13	1270	Ucok Tanugi
1	1150	Budi Santoso
2	1160	Siti Aminah
3	1170	Andi Wijaya
4	1180	Dayu Prakoso
5	1190	Bayu Angkas
6	1200	Dewi Lestari
7	1210	Rina Marlina
8	1220	Rizky Hidayat
9	1230	Fajar Kurniawam
10	1240	Agus Setiawan
11	1250	Surya Putra
12	1260	Sukri Purnama
13	1270	Ucok Tanugi
\.


--
-- Data for Name: pintu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pintu (no_pintu, "Jenis_pintu", no_tempat) FROM stdin;
1	masuk	102
2	keluar	230
3	masuk	105
4	keluar	105
5	masuk	210
6	keluar	210
7	masuk	220
8	keluar	220
9	masuk	230
10	keluar	230
1	masuk	102
2	keluar	230
3	masuk	105
4	keluar	105
5	masuk	210
6	keluar	210
7	masuk	220
8	keluar	220
9	masuk	230
10	keluar	230
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 92kxLH5TRVfyGXnzWmaaAimgkk7DkxSbdusf9f5fRhmZS0ib3vRM9NTuQWAgZA2

