enum Orderstatus { pending, approved, completed }

String findStatus(Orderstatus status) {
  switch (status) {
    case Orderstatus.approved:
      {
        return 'Approved';
      }
    case Orderstatus.completed:
      {
        return 'Completed';
      }

    case Orderstatus.pending:
      {
        return 'Pending';
      }
  }
}
