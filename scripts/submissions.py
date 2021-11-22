import click
from typing import List
import os
import shutil

@click.command()
@click.argument("filenames", nargs=-1)
def main(filenames: List[str]):
    target_dir = "current_grading"
    os.makedirs(target_dir, exist_ok=True)

    for file in filenames:
        source_path = os.path.join('grading', file)
        if not source_path.endswith(".pdf"):
            source_path += ".pdf"

        shutil.copy(source_path, target_dir)


if __name__ == "__main__":
    main()
