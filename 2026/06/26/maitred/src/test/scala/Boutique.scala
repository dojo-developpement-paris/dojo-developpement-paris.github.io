import org.scalatest._
import flatspec._
import matchers._

enum Status:
  case ACCEPTED, REJECTED

case class Reservation(quantity: Int)

def reservation(quantity: Int): Reservation =
  Reservation(quantity)

def reserveTable(
    tableSize: Int,
    existingReservation: Seq[Reservation],
    candidateReservation: Reservation
): Status =
  if candidateReservation.quantity > tableSize then Status.REJECTED else Status.ACCEPTED

class ExampleSpec extends AnyFlatSpec with should.Matchers:

  "a reservation for one person and no existing reservations" should "be accepted" in:
    val status = reserveTable(12, Seq(), reservation(1))

    status should be(Status.ACCEPTED)

  "a reservation for thirteen persons for a table of size 12 and no existing reservations" should "be rejected" in:
    val status = reserveTable(12, Seq(), reservation(13))

    status should be(Status.REJECTED)

  "a reservation for fourteen persons for a table of size 12 and no existing reservations" should "be rejected" in:
    val status = reserveTable(12, Seq(), reservation(14))

    status should be(Status.REJECTED)

  "a reservation for 16 persons for a table of size 16 and no existing reservations" should "be accepted" in:
    val status = reserveTable(16, Seq(), reservation(16))

    status should be(Status.ACCEPTED)

/*
Table size 	Existing reservations 	Candidate reservation 	Expected outcome
done 12 	none 	Quantity: 1 	Accepted
done 12 	none 	Quantity: 13 	Rejected
12 	none 	Quantity: 12 	Accepted
4 	Quantity: 2, Date: 2023-09-14 	Quantity: 3, Date: 2023-09-14 	Rejected
10 	Quantity: 2, Date: 2023-09-14 	Quantity: 3, Date: 2023-09-14 	Accepted
10 	Quantity: 3, Date: 2023-09-14
Quantity: 2, Date: 2023-09-14
Quantity: 3, Date: 2023-09-14 	Quantity: 3, Date: 2023-09-14 	Rejected
4 	Quantity: 2, Date: 2023-09-15 	Quantity: 3, Date: 2023-09-14 	Accepted
 */
