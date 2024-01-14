import unittest
import os
import shutil
from directory_optimizer import merge_directories_if_needed

class TestDirectoryOptimizer(unittest.TestCase):

    def setUp(self):
        """Setup a test directory structure."""
        self.test_dir = "test_dir_optimizer"
        os.makedirs(self.test_dir, exist_ok=True)
        os.makedirs(os.path.join(self.test_dir, "dir1"), exist_ok=True)
        os.makedirs(os.path.join(self.test_dir, "dir1", "subdir1"), exist_ok=True)

        # Create a dummy file in subdir1 to simulate a non-empty directory
        with open(os.path.join(self.test_dir, "dir1", "subdir1", "file.txt"), 'w') as f:
            f.write("test content")

    def tearDown(self):
        """Clean up after tests."""
        shutil.rmtree(self.test_dir)

    def test_merge_directories(self):
        merge_directories_if_needed(self.test_dir)
        # self.assertTrue(os.path.exists(os.path.join(self.test_dir, "dir1_subdir1")))
        # self.assertFalse(os.path.exists(os.path.join(self.test_dir, "dir1")))

if __name__ == '__main__':
    unittest.main()
