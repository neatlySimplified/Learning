module default {
    scalar type Class extending enum<Mystic, Merchant, Rogue>;

    abstract type Person {
        required name: str;
        age : int16;
        multi places_visited: Place;
        lover: Person;
    }
    type PC extending Person {
        required class: Class;
    }
    type NPC extending Person{
    };

    type Vampire extending Person {
    }

    type Place {
        required name: str;
        other_name: str;
        important_places: array<str>;
    }
    type City extending Place{
        population: int32
    }

    type Country extending Place{
    }
    
    type MinorVampire extending Person{
        required master: Vampire;
    }

    type Conta {
        saldo : float32 {
            default := 0;
        }
    }
}
