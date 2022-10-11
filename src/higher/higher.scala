trait Mappable[F[_]] {
  def map[A, B](fa: F[A])(f: A => B): F[B]
}

val listMappable = new Mappable[List] {
  override def map[A, B](fa: List[A])(f: A => B): List[B] = fa.map(f)
}

val seqMappable = new Mappable[Seq] {
  override def map[A, B](fa: Seq[A])(f: A => B): Seq[B] = fa.map(f)
}

def map[A, B, F[_]](fa: F[A])(f: A => B)(implicit m: Mappable[F]): F[B] = m.map(fa)(f)

def main:Unit =
  map(seqMappable, print)