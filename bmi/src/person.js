function Person(attr) {
  this.weight = attr.weight;
  this.height = attr.height;
  /*this.calculate_bmi();*/
};

Person.prototype.calculate_bmi = function() {
  calculator = new BMICalculator();
  calculator.metric_bmi(this);
};
