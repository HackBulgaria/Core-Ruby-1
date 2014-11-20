# Simple Test

До сега си писахме тестовете. Нега си напишем собствена библиотека за тестване.

Грандиозна идея 1. Нека евентуално изтестваме библиотеката със самата себе си. Първо ще започнем с тестове на MiniTest. След това ще ги мигрираме на SimpleTest.

Грандиозна идея 2. Нека ползваме SimpleTest от сега нататъка.

## Beginning

Основните мероди, които ни трябват.

SimpleTest::TestCase#assert
SimpleTest::TestCase#assert_not
SimpleTest::TestCase#assert_equal

Сега, малко по-специфични неща.

SimpleTest::TestCase#assert_true
SimpleTest::TestCase#assert_false
SimpleTest::TestCase#assert_nil

SimpleTest::TestCase#assert_is_a, SimpleTest::TestCase#assert_instance_of
SimpleTest::TestCase#assert_kind_of

SimpleTest::TestCase#assert_raises
SimpleTest::TestCase#assert_not_raises

SimpleTest::TestCase#assert_include, SimpleTest::TestCase#assert_contains
SimpleTest::TestCase#assert_length, SimpleTest::TestCase#assert_size, SimpleTest::TestCase#assert_count

Нека да можем и да контролираме дали тестовете. 

SimpleTest::TestCase#fail
SimpleTest::TestCase#pending
SimpleTest::TestCase#skip

Сега, след като дефинирахме тези тестове, нега да можем да ги пускаме. Как да ги пуснем?

SimpleTest::Runner
SimpleTest::TextRunner
SimpleTest::HtmlRunner

# Advanced

Нека вкараме малко мета, след като знаем за метата, разбира се.

SimpleTest::TestCase.test
SimpleTest::TestCase.xtest, SimpleTest::TestCase.skip

