import {fizzbuzz} from './fizzbuzz';
import {describe} from "node:test";

describe('fizzbuzz spell checking', () => {
    test.each([
        {number:  1, expectedWord: '1'},     {number:  2, expectedWord: '2'},     {number:  3, expectedWord: 'Fizz'},  {number:  4, expectedWord: '4'},     {number:  5, expectedWord: 'Buzz'},
        {number:  6, expectedWord: 'Fizz'},  {number:  7, expectedWord: '7'},     {number:  8, expectedWord: '8'},     {number:  9, expectedWord: 'Fizz'},  {number:  10, expectedWord: 'Buzz'},
        {number:  11, expectedWord: '11'},   {number:  12, expectedWord: 'Fizz'}, {number:  13, expectedWord: '13'},   {number:  14, expectedWord: '14'},   {number:  15, expectedWord: 'Fizz Buzz'},
        {number:  16, expectedWord: '16'},   {number:  17, expectedWord: '17'},   {number:  18, expectedWord: 'Fizz'}, {number:  19, expectedWord: '19'},   {number:  20, expectedWord: 'Buzz'},
        {number:  21, expectedWord: 'Fizz'}, {number:  22, expectedWord: '22'},   {number:  23, expectedWord: '23'},   {number:  24, expectedWord: 'Fizz'}, {number:  25, expectedWord: 'Buzz'},
        {number:  26, expectedWord: '26'},   {number:  27, expectedWord: 'Fizz'}, {number:  28, expectedWord: '28'},   {number:  29, expectedWord: '29'},   {number:  30, expectedWord: 'Fizz Buzz'},
        {number:  31, expectedWord: '31'},   {number:  32, expectedWord: '32'},   {number:  33, expectedWord: 'Fizz'}, {number:  34, expectedWord: '34'},   {number:  35, expectedWord: 'Buzz'},
        {number:  36, expectedWord: 'Fizz'}, {number:  37, expectedWord: '37'},   {number:  38, expectedWord: '38'},   {number:  39, expectedWord: 'Fizz'}, {number:  40, expectedWord: 'Buzz'},
        {number:  41, expectedWord: '41'},   {number:  42, expectedWord: 'Fizz'}, {number:  43, expectedWord: '43'},   {number:  44, expectedWord: '44'},   {number:  45, expectedWord: 'Fizz Buzz'},
        {number:  46, expectedWord: '46'},   {number:  47, expectedWord: '47'},   {number:  48, expectedWord: 'Fizz'}, {number:  49, expectedWord: '49'},   {number:  50, expectedWord: 'Buzz'},
        {number:  51, expectedWord: 'Fizz'}, {number:  52, expectedWord: '52'},   {number:  53, expectedWord: '53'},   {number:  54, expectedWord: 'Fizz'}, {number:  55, expectedWord: 'Buzz'},
        {number:  56, expectedWord: '56'},   {number:  57, expectedWord: 'Fizz'}, {number:  58, expectedWord: '58'},   {number:  59, expectedWord: '59'},   {number:  60, expectedWord: 'Fizz Buzz'},
        {number:  61, expectedWord: '61'},   {number:  62, expectedWord: '62'},   {number:  63, expectedWord: 'Fizz'}, {number:  64, expectedWord: '64'},   {number:  65, expectedWord: 'Buzz'},
        {number:  66, expectedWord: 'Fizz'}, {number:  67, expectedWord: '67'},   {number:  68, expectedWord: '68'},   {number:  69, expectedWord: 'Fizz'}, {number:  70, expectedWord: 'Buzz'},
        {number:  71, expectedWord: '71'},   {number:  72, expectedWord: 'Fizz'}, {number:  73, expectedWord: '73'},   {number:  74, expectedWord: '74'},   {number:  75, expectedWord: 'Fizz Buzz'},
        {number:  76, expectedWord: '76'},   {number:  77, expectedWord: '77'},   {number:  78, expectedWord: 'Fizz'}, {number:  79, expectedWord: '79'},   {number:  80, expectedWord: 'Buzz'},
        {number:  81, expectedWord: 'Fizz'}, {number:  82, expectedWord: '82'},   {number:  83, expectedWord: '83'},   {number:  84, expectedWord: 'Fizz'}, {number:  85, expectedWord: 'Buzz'},
        {number:  86, expectedWord: '86'},   {number:  87, expectedWord: 'Fizz'}, {number:  88, expectedWord: '88'},   {number:  89, expectedWord: '89'},   {number:  90, expectedWord: 'Fizz Buzz'},
        {number:  91, expectedWord: '91'},   {number:  92, expectedWord: '92'},   {number:  93, expectedWord: 'Fizz'}, {number:  94, expectedWord: '94'},   {number:  95, expectedWord: 'Buzz'},
        {number:  96, expectedWord: 'Fizz'}, {number:  97, expectedWord: '97'},   {number:  98, expectedWord: '98'},   {number:  99, expectedWord: 'Fizz'}, {number:  100, expectedWord: 'Buzz'}
        ])('$number should be spelled as $expectedWord', ({number, expectedWord: spelledAsExpected}) => {
            const wordToSpell = fizzbuzz(number);

            expect(wordToSpell).toBe(spelledAsExpected)
    });
});