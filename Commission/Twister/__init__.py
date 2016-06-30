from Twister import Twister

def create_instance(c_instance):
    """ Creates and returns the Twister script """
    return Twister(c_instance)

from _Framework.Capabilities import *

def get_capabilities():
	return {CONTROLLER_ID_KEY: controller_id(vendor_id=2580, product_ids=[0007], model_name='Midi Fighter Twister'),
	 PORTS_KEY: [inport(props=[NOTES_CC, SCRIPT, REMOTE]), outport(props=[SCRIPT, REMOTE])]}