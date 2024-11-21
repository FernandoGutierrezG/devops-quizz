from django.test import TestCase
from django.urls import reverse
from .models import Counter

class CounterModelTest(TestCase):
    
    def test_initial_count(self):
        expected = 0
        counter = Counter.objects.create()
        self.assertEqual(counter.value, expected)

    def test_increment_count(self):
        expected = 1
        counter = Counter.objects.create()
        counter.value += 1
        counter.save()
        self.assertEqual(counter.value, expected)

class CounterViewsTest(TestCase):

    def setUp(self):
        # Initialize the counter before each test
        self.counter = Counter.objects.create()

    def test_index_view_initial_count(self):
        # Test that the index page displays the correct initial count
        expected = '<span id="increment_counter_label">0</span>'
        response = self.client.get(reverse('home'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, expected)   

    def test_increment_counter_view(self):
        # Test that clicking the increment button increases the count by 1
        expected = 1
        response = self.client.post(reverse('increment_counter'))
        self.counter.refresh_from_db()
        self.assertEqual(self.counter.value, expected)
    
    def test_get_counter_view(self):
        # Test that 'get' button shows the updated count
        expected = '<span id="increment_counter_label">5</span>'
        self.counter.value = 5
        self.counter.save()
        response = self.client.get(reverse('home'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, expected)