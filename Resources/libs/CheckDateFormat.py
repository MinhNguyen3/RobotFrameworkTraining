from datetime import datetime

def is_valid_datetime(string):
    formats = ["%d-%m-%Y", "%d/%m/%Y"]
    for format in formats:
        try:
            datetime.strptime(string, format)
            print(f"The string matches the format: {format}")
            return True
        except ValueError:
            pass
    print("The string does not match any valid format.")
    return False


