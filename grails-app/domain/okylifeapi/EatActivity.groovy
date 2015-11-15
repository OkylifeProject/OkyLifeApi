package okylifeapi

class EatActivity extends Activity {
    String type
    double portionSize
    double totalPortions
    double totalFat
    double totalCarbohydrates
    double totalProteins
    double totalCalories
    static hasMany = [ingredients: Ingredient]

    static constraints = {
        type inList: ["Breakfast", "Lunch", "Dinner", "Snack", "Aperitif"]
        portionSize min: (double) 0
        totalCarbohydrates min: (double) 0
        totalPortions min: (double) 0
        totalFat min: (double) 0
        totalProteins min: (double) 0
        totalCalories min: (double) 0
        ingredients nullable: true
    }
}
