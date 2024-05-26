String bmiResult(double result) {
  if (result < 18.5) {
    return "Underweight";
  } else if (result >= 18.5 && result <= 24.9) {
    return "Normal weight";
  } else if (result >= 25 && result <= 29.9) {
    return "Overweight";
  } else {
    return "Obesity";
  }
}

String bmiAdvice(double result) {
  if (result < 18.5) {
    return "Increase nutrient-dense food intake and incorporate strength training. Consult a healthcare provider for underlying issues.";
  } else if (result >= 18.5 && result <= 24.9) {
    return "Maintain a balanced diet and regular exercise routine. Continue regular health check-ups.";
  } else if (result >= 25 && result <= 29.9) {
    return "Reduce processed foods and increase physical activity. Aim for 150 minutes of moderate exercise weekly.";
  } else {
    return "Stoooooooop Eating Fried Chicken";
  }
}
