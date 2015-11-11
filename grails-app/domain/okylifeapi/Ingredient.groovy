package okylifeapi

class Ingredient {
    String name
    String brand
    String description
    double number
    double fat
    double carbohydrates
    double proteins

    //TODO delete relation
    static belongsTo = [eatActivity: EatActivity]
    
    static constraints = {
        number min: (double) 1
        fat min: (double) 0
        carbohydrates min: (double) 0
        proteins min: (double) 0
    }
}
