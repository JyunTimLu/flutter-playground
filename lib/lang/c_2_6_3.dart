abstract class Worker {
  void doWork();
}

class Teacher extends Worker {
  @override
  void doWork() {
    print("老師在上課");
  }
}

class Engineer extends Worker {
  @override
  void doWork() {
    print("工程師在工作");
  }
}

abstract class CanFixComputer {
  factory CanFixComputer._() {
    return null;
  }

  void fixComputer();
}

class CanProgramming {
  factory CanProgramming._() {
    return null;
  }

  void programming() {}
}

class SoftwareEngineer extends Engineer with CanFixComputer, CanProgramming {
  @override
  void fixComputer() {
    print("軟體工程師修電腦");
  }

  @override
  void programming() {
    print("碼農在正寫code");
  }
}

class ITTeacher extends Teacher with CanFixComputer {
  @override
  void fixComputer() {
    print("IT老師修電腦");
  }
}

void main() {
  ITTeacher()
    ..doWork()
    ..fixComputer();

  SoftwareEngineer()
    ..doWork()
    ..fixComputer()
    ..programming();
}
