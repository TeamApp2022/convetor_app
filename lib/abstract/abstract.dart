class Refreshable {
  void refresh() {}
}

class DialogFactory {
  void dialogShow(String message) {}

  void dialogShowCancellable(String message, Function cancelFunction) {}

  void dialogUpdate(String message) {}

  void dialogHide() {}
}

class RefreshablePlayerDialogFactory implements Refreshable, DialogFactory {
  @override
  void dialogHide() {}

  @override
  void dialogUpdate(String message) {}

  @override
  void refresh() {}

  @override
  void dialogShow(String message) {}

  @override
  void dialogShowCancellable(String message, Function cancelFunction) {}
}
