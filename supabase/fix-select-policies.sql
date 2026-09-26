-- Corrige un bug : la lecture des produits/categories n'etait autorisee que
-- pour les visiteurs NON connectes (role "anon"). Des qu'un admin est connecte,
-- la base de donnees ne renvoyait plus aucune ligne, meme sur le catalogue
-- public si l'admin restait connecte en naviguant dessus.
--
-- A executer UNE SEULE FOIS dans le SQL Editor de Supabase.

drop policy if exists "Lecture publique des produits" on products;
create policy "Lecture publique des produits"
on products for select
to public
using (true);

drop policy if exists "Lecture publique des categories" on categories;
create policy "Lecture publique des categories"
on categories for select
to public
using (true);
