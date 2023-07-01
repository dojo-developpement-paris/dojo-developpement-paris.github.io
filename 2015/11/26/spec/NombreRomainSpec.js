describe("Nombre Romain", function() {
    it("devrait convertir I en 1", function() {
        expect(convertir("I")).toEqual(1);
    });
    it("devrait convertir II en 2", function() {
        expect(convertir("II")).toEqual(2);
    });
    it("devrait convertir III en 3", function() {
        expect(convertir("III")).toEqual(3);
    });
    it("devrait convertir V en 5", function() {
        expect(convertir("V")).toEqual(5);
    });
    it("devrait convertir X en 10", function() {
        expect(convertir("X")).toEqual(10);
    });
    it("devrait convertir XX en 20", function() {
        expect(convertir("XX")).toEqual(20);
    });
    it("devrait convertir VI en 6", function() {
        expect(convertir("VI")).toEqual(6);
    });
    it("devrait convertir VII en 7", function() {
        expect(convertir("VII")).toEqual(7);
    });
    it("devrait convertir IX en 9", function() {
        expect(convertir("IX")).toEqual(9);
    });
    it("devrait convertir XC en 90", function() {
        expect(convertir("XC")).toEqual(90);
    });
    it("devrait convertir XCIX en 99", function() {
        expect(convertir("XCIX")).toEqual(99);
    });
    it("devrait convertir CMXCIX en 999", function() {
        expect(convertir("CMXCIX")).toEqual(999);
    });
});


