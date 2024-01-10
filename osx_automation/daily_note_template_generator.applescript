tell application "Notes"
	set currentDate to current date
	set dateString to (day of currentDate as string) & "-" & (month of currentDate as string) & "-" & (year of currentDate as string)
	
	-- Retrieve the content from your template note
	set templateNote to body of first note whose name is "daily_template"
	
	
	-- Create the new note content
	set newNoteContent to "Date: " & dateString & return & templateNote & return
	
	-- Create the new note in a specific folder
	-- Replace 'Folder Name' with the name of your folder
	make new note at folder "Daily" with properties {name:"Today's Log " & dateString, body:newNoteContent}
end tell
