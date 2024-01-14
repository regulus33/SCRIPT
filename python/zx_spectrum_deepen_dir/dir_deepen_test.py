import unittest
import os
import shutil
from dir_deepen import find_common_prefixes, create_and_move_file, sort_files_by_prefix

class TestFileSorter(unittest.TestCase):

    def setUp(self):
        """Setup a test directory with test files."""
        self.test_dir = "test_dir"
        os.makedirs(self.test_dir, exist_ok=True)
        self.test_files = [
            "EMIGRE_#1_hello_world",
            "EMIGRE_#2_bye_world",
            "ABC-#1-test",
            "ABC-#2-demo",
            "ABC"
        ]
        for file in self.test_files:
            with open(os.path.join(self.test_dir, file), 'w') as f:
                f.write("test content")

    def tearDown(self):
        """Clean up after tests."""
        shutil.rmtree(self.test_dir)

    def test_find_common_prefixes_default_delimiter(self):
        common_prefixes = find_common_prefixes(self.test_dir)
        self.assertIn("EMIGRE", common_prefixes)
        self.assertNotIn("ABC", common_prefixes)

    def test_find_commmon_prefixes_with_space(self):
        common_prefixes = find_common_prefixes(self.test_dir)
        self.assertIn("EMIGRE", common_prefixes)
        self.assertNotIn("ABC", common_prefixes)

    def test_find_common_prefixes_custom_delimiter(self):
        common_prefixes = find_common_prefixes(self.test_dir, delimiter="-")
        self.assertIn("ABC", common_prefixes)
        self
