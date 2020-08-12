class SandGlass {
  int _sand = 100;

  int time() => _sand;

  Future tick() async {
    _sand = 100;
    while(_sand > 0) {
      await Future.delayed(const Duration(milliseconds: 1000));
      _sand--;
    }
  }
}