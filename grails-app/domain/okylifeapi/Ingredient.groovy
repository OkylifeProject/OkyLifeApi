package okylifeapi

class Ingredient {
    String name
    String description
    String rationType
    double number
    double fat
    double carbohydrates
    double proteins
    double calories

    static belongsTo = [eatActivity: EatActivity]

    static constraints = {
        number min: (double) 1
        fat min: (double) 0
        calories min: (double) 0
        carbohydrates min: (double) 0
        proteins min: (double) 0
        rationType inList: ["g", "ml", "Unities", "Spoonfuls", "Cups"]
    }
}
