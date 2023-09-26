CREATE TABLE "Animals"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutered" BOOLEAN NOT NULL,
    "weight_kg" DECIMAL(8, 2) NOT NULL,
    "species" VARCHAR(255) NOT NULL,
    "species_id" INTEGER NOT NULL,
    "owner_id" INTEGER NOT NULL
);
ALTER TABLE
    "Animals" ADD PRIMARY KEY("id");
CREATE TABLE "visits"(
    "id genrerated always" AS "identify" INTEGER NOT NULL,
    "animal_id" INTEGER NOT NULL,
    "vet_id" INTEGER NOT NULL,
    "date_of_visits" DATE NOT NULL,
    "primary key(id)" BIGINT NOT NULL
);
ALTER TABLE
    "visits" ADD PRIMARY KEY(
        "id genrerated always" AS "identify"
    );
CREATE TABLE "species"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "vets"(
    "id SERIAL PRIMARY KEY" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id SERIAL PRIMARY KEY");
CREATE TABLE "owners"(
    "id" INTEGER NOT NULL,
    "full_name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE TABLE "specializations"(
    "vets_id" INTEGER NOT NULL,
    "species_id" INTEGER NOT NULL
);
ALTER TABLE
    "specializations" ADD PRIMARY KEY("vets_id");
ALTER TABLE
    "specializations" ADD CONSTRAINT "specializations_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "vets" ADD CONSTRAINT "vets_name_foreign" FOREIGN KEY("name") REFERENCES "specializations"("vets_id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_vet_id_foreign" FOREIGN KEY("vet_id") REFERENCES "vets"("id SERIAL PRIMARY KEY");
ALTER TABLE
    "Animals" ADD CONSTRAINT "animals_owner_id_foreign" FOREIGN KEY("owner_id") REFERENCES "owners"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_id genrerated always" AS "identify_foreign" FOREIGN KEY(
        "id genrerated always" AS "identify"
    ) REFERENCES "Animals"("id");
ALTER TABLE
    "Animals" ADD CONSTRAINT "animals_species_foreign" FOREIGN KEY("species") REFERENCES "species"("id");