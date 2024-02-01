#define CATCH_CONFIG_MAIN
#include "/export/home/public/zhang/catch.hpp"
#include "fractionType.h"


TEST_CASE("fractionType arithmetic operations", "[fractionType]") {

    SECTION("addition") {
        fractionType a(1, 2);
        fractionType b(1, 3);
        fractionType c = a + b;
        REQUIRE(c == fractionType(5, 6));
    }

    SECTION("subtraction") {
        fractionType a(1, 2);
        fractionType b(1, 3);
        fractionType c = a - b;
        REQUIRE(c == fractionType(1, 6));
    }

    SECTION("multiplication") {
        fractionType a(1, 2);
        fractionType b(2, 3);
        fractionType c = a * b;
        REQUIRE(c == fractionType(1, 3));
    }

    SECTION("division") {
        fractionType a(1, 2);
        fractionType b(2, 3);
        fractionType c = a / b;
        REQUIRE(c == fractionType(3, 4));
    }

    SECTION("division2") {
        fractionType a(1, 2);
        fractionType b(0, 3);
        fractionType c = a / b;
        REQUIRE(c == fractionType(1, 2));
    }
}

TEST_CASE("fractionType relational operators", "[fractionType]") {

    SECTION("equality") {
        fractionType a(1, 2);
        fractionType b(2, 4);
        REQUIRE(a == b);
    }

    SECTION("inequality") {
        fractionType a(1, 2);
        fractionType b(2, 3);
        REQUIRE(a != b);
    }

    SECTION("less than or equal to") {
        fractionType a(1, 2);
        fractionType b(3, 4);
        REQUIRE(a <= b);
        REQUIRE(a <= a);
    }

    SECTION("greater than or equal to") {
        fractionType a(1, 2);
        fractionType b(3, 4);
        REQUIRE(b >= a);
        REQUIRE(a >= a);
    }

    SECTION("less than") {
        fractionType a(1, 2);
        fractionType b(3, 4);
        REQUIRE(a < b);
    }

    SECTION("greater than") {
        fractionType a(1, 2);
        fractionType b(3, 4);
        REQUIRE(b > a);
    }
}

TEST_CASE("fractionType increment and decrement operators", "[fractionType]") {

    SECTION("pre-increment") {
        fractionType a(1, 2);
        ++a;
        REQUIRE(a == fractionType(3, 2));
    }

    SECTION("post-increment") {
        fractionType a(1, 2);
        fractionType b = a++;
        REQUIRE(a == fractionType(3, 2));
        REQUIRE(b == fractionType(1, 2));
    }

    SECTION("pre-decrement") {
        fractionType a(3, 2);
        --a;
        REQUIRE(a == fractionType(1, 2));
    }

    SECTION("post-decrement") {
        fractionType a(3, 2);
        fractionType b = a--;
        REQUIRE(a == fractionType(1, 2));
        REQUIRE(b == fractionType(3, 2));
    }
}
